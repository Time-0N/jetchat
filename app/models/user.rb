class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :sub, presence: true, uniqueness: true

  def self.find_or_create_from_jwt(jwt_payload)
    Rails.logger.info "=== USER MODEL DEBUG ==="
    Rails.logger.info "JWT Payload received: #{jwt_payload.inspect}"
    Rails.logger.info "JWT Payload class: #{jwt_payload.class}"

    Rails.logger.info "Available JWT fields: #{jwt_payload.keys}"
    Rails.logger.info "Sub: #{jwt_payload['sub']}"
    Rails.logger.info "Email: #{jwt_payload['email']}"
    Rails.logger.info "Name: #{jwt_payload['name']}"
    Rails.logger.info "Given name: #{jwt_payload['given_name']}"
    Rails.logger.info "Family name: #{jwt_payload['family_name']}"

    if jwt_payload["sub"].blank?
      Rails.logger.error "Missing 'sub' field in JWT payload"
      raise "Missing required 'sub' field"
    end

    if jwt_payload["email"].blank?
      Rails.logger.error "Missing 'email' field in JWT payload"
      raise "Missing required 'email' field"
    end

    Rails.logger.info "Looking for existing user with sub: #{jwt_payload['sub']}"

    user = where(sub: jwt_payload["sub"]).first_or_create do |new_user|
      Rails.logger.info "=== CREATING NEW USER ==="
      Rails.logger.info "Creating new user with sub: #{jwt_payload['sub']}"

      new_user.sub = jwt_payload["sub"]
      new_user.email = jwt_payload["email"]
      new_user.name = jwt_payload["name"] || build_full_name(jwt_payload)
      new_user.first_name = jwt_payload["given_name"]
      new_user.last_name = jwt_payload["family_name"]
      new_user.metadata = jwt_payload

      Rails.logger.info "New user attributes before save:"
      Rails.logger.info "  sub: #{new_user.sub}"
      Rails.logger.info "  email: #{new_user.email}"
      Rails.logger.info "  name: #{new_user.name}"
      Rails.logger.info "  first_name: #{new_user.first_name}"
      Rails.logger.info "  last_name: #{new_user.last_name}"
    end

    Rails.logger.info "=== USER CREATION RESULT ==="
    Rails.logger.info "User persisted: #{user.persisted?}"
    Rails.logger.info "User errors: #{user.errors.full_messages}" if user.errors.any?
    Rails.logger.info "Final user: #{user.inspect}"
    Rails.logger.info "=== END USER MODEL DEBUG ==="

    user
  end

  private

  def self.build_full_name(jwt_payload)
    given = jwt_payload["given_name"]
    family = jwt_payload["family_name"]
    return nil if given.blank? && family.blank?

    "#{given} #{family}".strip
  end
end
