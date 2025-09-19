module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    def find_verified_user
      id_token = cookies.signed[:id_token]

      if id_token
        begin
          jwt_payload = JwtService.get_user_from_token(id_token)
          user = User.find_by(sub: jwt_payload["sub"])
          return user if user
        rescue => e
          Rails.logger.error "WebSocket authentication failed: #{e.message}"
        end
      end

      reject_unauthorized_connection
    end
  end
end
