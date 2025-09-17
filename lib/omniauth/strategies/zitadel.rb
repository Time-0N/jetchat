require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Zitadel < OmniAuth::Strategies::OAuth2
      option :name, "zitadel"

      option :client_options, {
        site: ENV["ZITADEL_ISSUER"],
        authorize_url: "/oauth/v2/authorize",
        token_url: "/oauth/v2/token"
      }

      option :scope, "openid profile email"
      option :response_type, "code"
      option :access_type, "offline"
      option :prompt, "consent"

      uid { raw_info["sub"] }

      info do
        {
          email: raw_info["email"],
          name: raw_info["name"] || "#{raw_info['given_name']} #{raw_info['family_name']}".strip,
          first_name: raw_info["given_name"],
          last_name: raw_info["family_name"],
          image: raw_info["picture"]
        }
      end

      extra do
        {
          "raw_info" => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/oidc/v1/userinfo").parsed
      end

      def callback_url
        full_host + script_name + callback_path
      end

      def authorize_params
        super.tap do |params|
          if options[:pkce]
            verifier = generate_pkce_verifier
            challenge = generate_pkce_challenge(verifier)

            session["omniauth.pkce_verifier"] = verifier

            params[:code_challenge] = challenge
            params[:code_challenge_method] = "S256"
          end
        end
      end

      def token_params
        super.tap do |params|
          if options[:pkce] && session["omniauth.pkce_verifier"]
            params[:code_verifier] = session["omniauth.pkce_verifier"]
            session.delete("omniauth.pkce_verifier")
          end
        end
      end

      protected def build_access_token
        verifier = request.params["code"]
        client.auth_code.get_token(
          verifier,
          { redirect: callback_url }.merge(token_params),
          { authenticate: :body }
        )
      end

      private

      def generate_pkce_verifier
        SecureRandom.urlsafe_base64(96)
      end

      def generate_pkce_challenge(verifier)
        Base64.urlsafe_encode64(
          Digest::SHA256.digest(verifier),
          padding: false
        )
      end
    end
  end
end
