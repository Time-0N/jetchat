class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validate :sub, presence: true, uniqueness: true

  def self.find_or_create_from_jwt(jwt_payload)
    where(sub: jwt_payload["sub"]).first_or_create do |user|
      user.email = jwt_payload["email"]
      user.name = jwt_payload["name"] || "#{jwt_payload['given_name']} #{jwt_payload['family_name']}".strip
      user.first_name = jwt_payload["given_name"]
      user.first_name = jwt_payload["given_name"]
      user.last_name = jwt_payload["family_name"]
      user.metadata = jwt_payload
    end
  end
end
