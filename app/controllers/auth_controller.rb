require "net/http"
require "uri"
require "json"
require "base64"
require "securerandom"
require "digest"

class AuthController < ApplicationController
  skip_before_action :authenticate_request

  def login
    redirect_to authorization_url, allow_other_host: true
  end

  def register
    redirect_to registration_url, allow_other_host: true
  end

  def callback
    if params[:code].present?
      tokens = exchange_code_for_tokens(params[:code])

      if tokens
        decoded_id_token = JWT.decode(tokens[:id_token], nil, false)
        Rails.logger.info "ID Token payload: #{decoded_id_token[0].inspect}"
        set_auth_cookies(tokens)

        redirect_to "/dashboard", notice: "Login Successful!"
      else
        redirect_to root_path, alert: "Authentication failed - could not exchange code for tokens"
      end
    else
      redirect_to root_path, alert: "Authentication failed - no authorization code received"
    end
  end

  def refresh
    refresh_token = params[:refresh_token]

    response = refresh_access_token(refresh_token)

    if response
      cookies.signed[:access_token] = {
        value: response["access_token"],
        expires: response["expires_in"].seconds.from_now,
        httponly: true,
        secure: Rails.env.production?,
        same_site: :strict
      }

      render json: {
        access_token: response["access_token"],
        expires_in: response["expires_in"]
      }
    else
      render json: { error: "Failed to refresh token" }, status: :unauthorized
    end
  end

  def logout
    clear_auth_cookies

    logout_url = "#{ENV['ZITADEL_ISSUER']}/oidc/v1/end_session"
    redirect_to logout_url, allow_other_host: true
  end

  private

  def authorization_url
    @code_verifier = SecureRandom.urlsafe_base64(32)
    code_challenge = Base64.urlsafe_encode64(
      Digest::SHA256.digest(@code_verifier),
      padding: false
    )

    session[:code_verifier] = @code_verifier

    params = {
      client_id: ENV["ZITADEL_CLIENT_ID"],
      redirect_uri: auth_callback_url(host: request.host, port: request.port),
      response_type: "code",
      scope: "openid profile email offline_access",
      code_challenge: code_challenge,
      code_challenge_method: "S256"
    }

    "#{ENV['ZITADEL_ISSUER']}/oauth/v2/authorize?#{params.to_query}"
  end

  def registration_url
    @code_verifier = SecureRandom.urlsafe_base64(32)
    code_challenge = Base64.urlsafe_encode64(
      Digest::SHA256.digest(@code_verifier),
      padding: false
    )

    session[:code_verifier] = @code_verifier

    params = {
      client_id: ENV["ZITADEL_CLIENT_ID"],
      redirect_uri: auth_callback_url(host: request.host, port: request.port),
      response_type: "code",
      scope: "openid profile email offline_access",
      code_challenge: code_challenge,
      code_challenge_method: "S256",
      # Add registration-specific parameters
      screen_hint: "register",
      prompt: "create"
    }

    "#{ENV['ZITADEL_ISSUER']}/oauth/v2/authorize?#{params.to_query}"
  end

  def exchange_code_for_tokens(code)
    uri = URI("#{ENV['ZITADEL_ISSUER']}/oauth/v2/token")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = false if uri.host == "localhost"

    http_request = Net::HTTP::Post.new(uri)
    http_request["Content-Type"] = "application/x-www-form-urlencoded"

    http_request.set_form_data({
                            "grant_type" => "authorization_code",
                            "code" => code,
                            "redirect_uri" => auth_callback_url(host: request.host, port: request.port),
                            "client_id" => ENV["ZITADEL_CLIENT_ID"],
                            "code_verifier" => session[:code_verifier]
                          })

    http_response = http.request(http_request)

    Rails.logger.info "Token response code: #{http_response.code}"
    Rails.logger.info "Token response body: #{http_response.body}"

    if http_response.code == "200"
      JSON.parse(http_response.body).symbolize_keys
    else
      Rails.logger.error "Token exchange failed: #{http_response.body}"
      nil
    end
  ensure
    session.delete(:code_verifier)
  end

  def refresh_access_token(refresh_token)
    return nil unless refresh_token

    uri = URI("#{ENV['ZITADEL_ISSUER']}/oauth/v2/token")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = false if uri.host == "localhost"

    http_request = Net::HTTP::Post.new(uri)
    http_request["Content-Type"] = "application/x-www-form-urlencoded"

    http_request.set_form_data({
                            "grant_type" => "refresh_token",
                            "refresh_token" => refresh_token,
                            "client_id" => ENV["ZITADEL_CLIENT_ID"]
                          })

    http_response = http.request(http_request)

    if http_response.code == "200"
      JSON.parse(http_response.body)
    else
      Rails.logger.error "Token refresh failed: #{http_response.body}"
      nil
    end
  end

  def set_auth_cookies(tokens)
    cookie_options = {
      httponly: true,
      secure: Rails.env.production?,
      same_site: :strict
    }

    cookies.signed[:access_token] = cookie_options.merge(
      value: tokens[:access_token],
      expires: 1.hour.from_now
    )

    cookies.signed[:id_token] = cookie_options.merge(
      value: tokens[:id_token],
      expires: 1.hour.from_now
    )

    cookies.signed[:refresh_token] = cookie_options.merge(
      value: tokens[:refresh_token],
      expires: 30.days.from_now
    )

    Rails.logger.info "Auth cookies set successfully"
  end

  def clear_auth_cookies
    cookies.delete(:access_token, httponly: true, secure: Rails.env.production?, same_site: :strict)
    cookies.delete(:id_token, httponly: true, secure: Rails.env.production?, same_site: :strict)
    cookies.delete(:refresh_token, httponly: true, secure: Rails.env.production?, same_site: :strict)

    Rails.logger.info "Auth cookies cleared"
  end
end
