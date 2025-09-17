class JwtService
  class << self
    def decode(token)
      jwks_uri = "#{ENV['ZITADEL_ISSUER']}/oauth/v2/keys"
      jwks = fetch_jwks(jwks_uri)

      JWT.decode(
        token,
        nil,
        true,
        {
          algorithms: [ "RS256" ],
          iss: ENV["ZITADEL_ISSUER"],
          verify_iss: true,
          verify_iat: true,
          verify_exp: true,
          jwks: jwks
        }
      )
    rescue JWT::ExpiredSignature
      raise StandardError, "Token has expired"
    rescue JWT::InvalidIssuerError
      raise StandardError, "Invalid issuer"
    rescue JWT::DecodeError => e
      raise StandardError, "Token decode error: #{e.message}"
    end

    def get_user_from_token(token)
      decoded = decode(token)
      decoded.first
    end

    private

    def fetch_jwks(url)
      response = Net::HTTP.get_response(URI(url))
      jwks_data = JSON.parse(response.body)
      { keys: jwks_data["keys"] }
    end
  end
end
