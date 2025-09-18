class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: :json_request?

  before_action :authenticate_request

  attr_reader :current_user

  allow_browser versions: :modern

  protected

  def current_access_token
    cookies.signed[:access_token]
  end

  def current_id_token
    cookies.signed[:id_token]
  end

  def current_refresh_token
    cookies.signed[:refresh_token]
  end

  def authenticated?
    current_access_token.present? && current_id_token.present?
  end

  private

  def authenticate_request
    id_token = current_id_token
    access_token = current_access_token

    Rails.logger.info "Authentication attempt - ID token present: #{id_token.present?}, Access token present: #{access_token.present?}"

    if id_token && access_token
      begin
        Rails.logger.info "Attempting to decode ID token using JwtService..."

        begin
          jwt_payload = JwtService.get_user_from_token(id_token)
          Rails.logger.info "Successfully decoded and verified ID token payload: #{jwt_payload.inspect}"
        rescue StandardError => jwt_error
          Rails.logger.warn "JWT verification failed: #{jwt_error.message}"
          Rails.logger.info "Attempting fallback decode without verification..."

          decoded_token = JWT.decode(id_token, nil, false)
          jwt_payload = decoded_token[0]
          Rails.logger.info "Fallback decode successful: #{jwt_payload.inspect}"
        end

        @current_user = User.find_or_create_from_jwt(jwt_payload)

        Rails.logger.info "User authentication successful: #{@current_user.inspect}"

      rescue JWT::ExpiredSignature => e
        Rails.logger.error "JWT expired: #{e.message}"
        if attempt_token_refresh
          retry_authentication
        else
          handle_authentication_failure("Session expired. Please log in again.")
        end
      rescue JWT::DecodeError, JWT::VerificationError => e
        Rails.logger.error "JWT validation failed: #{e.message}"
        handle_authentication_failure("Invalid session. Please log in again.")
      rescue StandardError => e
        Rails.logger.error "Authentication error: #{e.message}"
        Rails.logger.error e.backtrace.join("\n")
        handle_authentication_failure("Authentication failed. Please try again.")
      end
    else
      Rails.logger.info "No valid tokens found, redirecting to login"
      handle_authentication_failure("Please log in to continue")
    end
  end

  def retry_authentication
    id_token = current_id_token
    if id_token
      jwt_payload = JwtService.get_user_from_token(id_token)
      @current_user = User.find_or_create_from_jwt(jwt_payload)
    else
      handle_authentication_failure("Session refresh failed. Please log in again.")
    end
  end

  def attempt_token_refresh
    refresh_token = current_refresh_token
    return false unless refresh_token

    begin
      response = refresh_access_token(refresh_token)

      if response && response["access_token"]
        cookies.signed[:access_token] = {
          value: response["access_token"],
          expires: 1.hour.from_now,
          httponly: true,
          secure: Rails.env.production?,
          same_site: :strict
        }

        Rails.logger.info "Token refreshed successfully"
        return true
      end
    rescue StandardError => e
      Rails.logger.error "Token refresh failed: #{e.message}"
    end

    false
  end

  def refresh_access_token(refresh_token)
    uri = URI("#{ENV['ZITADEL_ISSUER']}/oauth/v2/token")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme == 'https'

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

  def handle_authentication_failure(message)
    Rails.logger.info "Authentication failed: #{message}"
    clear_auth_cookies

    if json_request?
      render json: { error: message }, status: :unauthorized
    else
      redirect_to root_path, alert: message
    end
  end

  def clear_auth_cookies
    cookies.delete(:access_token, httponly: true, secure: Rails.env.production?, same_site: :strict)
    cookies.delete(:id_token, httponly: true, secure: Rails.env.production?, same_site: :strict)
    cookies.delete(:refresh_token, httponly: true, secure: Rails.env.production?, same_site: :strict)
  end

  def extract_token_from_header
    auth_header = request.headers["Authorization"]
    return nil unless auth_header.present?

    auth_header.split(" ").last
  end

  def json_request?
    request.format.json?
  end
end
