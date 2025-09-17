class Api::BaseController < ActionController::API
  before_action :authenticate_request

  attr_reader :current_user

  private

  def authenticate_request
    token = extract_token_from_header

    if token
      begin
        jwt_payload = JwtService.get_user_from_token(token)
        @current_user = User.find_or_create_from_jwt(jwt_payload)
      rescue StandardError => e
        render json: { error: e.message }, status: :unauthorized
      end
    else
      render json: { error: "No authorization token provided" }, status: :unauthorized
    end
  end

  def extract_token_from_header
    auth_header = request.headers["Authorization"]
    return nil unless auth_header.present?

    auth_header.split(" ").last
  end
end
