require_relative "../../lib/omniauth/strategies/zitadel"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :zitadel,
           ENV["ZITADEL_CLIENT_ID"],
           nil,
           {
             scope: "openid profile email",
             pkce: true,  # Enable PKCE
             client_options: {
               site: ENV["ZITADEL_ISSUER"],
               authorize_url: "#{ENV['ZITADEL_ISSUER']}/oauth/v2/authorize",
               token_url: "#{ENV['ZITADEL_ISSUER']}/oauth/v2/token",
               auth_scheme: :request_body
             }
           }
end

# Configure OmniAuth to handle CSRF with null_session for API compatibility
OmniAuth.config.allowed_request_methods = [ :post, :get ]
OmniAuth.config.silence_get_warning = true
