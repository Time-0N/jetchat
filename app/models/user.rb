class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :sub, presence: true, uniqueness: true
  has_many :sent_friend_requests, class_name: "FriendRequest", foreign_key: "sender_id", dependent: :destroy
  has_many :received_friend_requests, class_name: "FriendRequest", foreign_key: "receiver_id", dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id", dependent: :destroy
  has_many :inverse_friends, through: :inverse_friendships, source: :user
  has_many :chat_room_memberships, dependent: :destroy
  has_many :chat_rooms, through: :chat_room_memberships
  has_many :created_chat_rooms, class_name: "ChatRoom", foreign_key: "created_by_id"
  has_many :messages, dependent: :destroy

  def self.find_or_create_from_jwt(jwt_payload)
    if jwt_payload["sub"].blank?
      raise "Missing required 'sub' field"
    end

    if jwt_payload["email"].blank?
      raise "Missing required 'email' field"
    end

    user = where(sub: jwt_payload["sub"]).first_or_initialize do |new_user|
      new_user.sub = jwt_payload["sub"]
    end

    # Extract user data from JWT
    new_email = jwt_payload["email"]
    new_name = jwt_payload["name"] || build_full_name(jwt_payload)
    new_first_name = jwt_payload["given_name"]
    new_last_name = jwt_payload["family_name"]

    # Check if any user data has changed
    data_changed = user.new_record? ||
                   user.email != new_email ||
                   user.name != new_name ||
                   user.first_name != new_first_name ||
                   user.last_name != new_last_name

    if data_changed
      user.assign_attributes(
        email: new_email,
        name: new_name,
        first_name: new_first_name,
        last_name: new_last_name,
        metadata: jwt_payload
      )

      user.save!
      Rails.logger.info "Updated user #{user.sub} with new data from JWT"
    else
      # Still update metadata to keep it fresh
      if user.metadata != jwt_payload
        user.update!(metadata: jwt_payload)
        Rails.logger.info "Updated metadata for user #{user.sub}"
      end
    end

    user
  end

  def all_friends
    User.where(id: friends.pluck(:id) + inverse_friends.pluck(:id)).distinct
  end

  def friends_with?(other_user)
    friendships.exists?(friend: other_user) || inverse_friendships.exists?(user: other_user)
  end

  def friend_request_pending?(other_user)
    FriendRequest.pending.exists?(sender: self, receiver: other_user) ||
      FriendRequest.pending.exists?(sender: other_user, receiver: self)
  end

  def send_friend_request(to_user, message = nil)
    return false if friends_with?(to_user) || friend_request_pending?(to_user)

    sent_friend_requests.create(receiver: to_user, message: message)
  end

  def self.search_by_name(query, limit: 10)
    return none if query.blank?

    exact_matches = where("LOWER(name) LIKE ?", "#{query.downcase}%")
                      .or(where("LOWER(first_name) LIKE ?", "#{query.downcase}%"))
                      .or(where("LOWER(last_name) LIKE ?", "#{query.downcase}%"))
                      .limit(limit)

    return exact_matches if exact_matches.count >= limit

    if connection.adapter_name.downcase.include?("postgresql")
      similarity_matches = where(
        "similarity(LOWER(name), ?) > 0.3 OR similarity(LOWER(first_name || ' ' || last_name), ?) > 0.3",
        query.downcase, query.downcase
      ).order(
        Arel.sql("GREATEST(similarity(LOWER(name), '#{query.downcase}'), similarity(LOWER(first_name || ' ' || last_name), '#{query.downcase}')) DESC")
      ).limit(limit - exact_matches.count)

      (exact_matches + similarity_matches).uniq.first(limit)
    else
      like_matches = where(
        "LOWER(name) LIKE ? OR LOWER(first_name) LIKE ? OR LOWER(last_name) LIKE ?",
        "%#{query.downcase}%", "%#{query.downcase}%", "%#{query.downcase}%"
      ).where.not(id: exact_matches.pluck(:id))
       .limit(limit - exact_matches.count)

      exact_matches + like_matches
    end
  end

  def pending_friend_requests_count
    received_friend_requests.pending.count
  end

  def self.for_discovery(current_user, page: 1, per_page: 10)
    friend_ids = current_user.all_friends.pluck(:id)
    excluded_ids = friend_ids + [ current_user.id ]

    where.not(id: excluded_ids)
         .order(created_at: :desc)
         .page(page)
         .per(per_page)
  end

  def can_chat_with?(other_user)
    friends_with?(other_user)
  end

  def unread_messages_count
    total_unread = 0

    chat_room_memberships.includes(:chat_room).each do |membership|
      last_read = membership.last_read_at || membership.created_at
      unread_in_room = membership.chat_room.messages
                                 .where("created_at > ?", last_read)
                                 .where.not(user_id: id)
                                 .count
      total_unread += unread_in_room
    end

    total_unread
  end


  private

  def self.build_full_name(jwt_payload)
    given = jwt_payload["given_name"]
    family = jwt_payload["family_name"]
    return nil if given.blank? && family.blank?

    "#{given} #{family}".strip
  end
end
