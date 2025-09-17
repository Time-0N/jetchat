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

  def callback
    if params[:code].present?
      tokens = exchange_code_for_tokens(params[:code])

      if tokens
        @access_token = tokens[:access_token]
        @id_token = tokens[:id_token]
        @refresh_token = tokens[:refresh_token]

        render :callback
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
      render json: {
        access_token: response["access_token"],
        expires_in: response["expires_in"]
      }
    else
      render json: { error: "Failed to refresh token" }, status: :unauthorized
    end
  end

  def logout
    reset_session

    logout_url = "#{ENV['ZITADEL_ISSUER']}/oidc/v1/end_session"
    redirect_to logout_url, allow_other_host: true

    redirect_to root_path, notice: "Logged out successfully"
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
end
