class ChatRoom < ApplicationRecord
  belongs_to :created_by, class_name: "User"
  has_many :chat_room_memberships, dependent: :destroy
  has_many :users, through: :chat_room_memberships
  has_many :messages, dependent: :destroy

  validates :name, presence: true, if: -> { !is_private? }

  scope :public_rooms, -> { where(is_private: false) }
  scope :private_rooms, -> { where(is_private: true) }

  def last_message
    messages.order(created_at: :desc).first
  end

  def unread_count_for_user(user)
    membership = chat_room_memberships.find_by(user: user)
    return 0 unless membership

    last_read = membership.last_read_at || membership.joined_at
    messages.where("created_at > ?", last_read).count
  end

  def other_user(current_user)
    return nil unless is_private?
    users.where.not(id: current_user.id).first
  end

  def self.private_chat_between(user1, user2)
    chat_room = ChatRoom.joins(:chat_room_memberships)
                        .where(is_private: true)
                        .where(chat_room_memberships: { user: [ user1, user2 ] })
                        .group("chat_rooms.id")
                        .having("COUNT(chat_room_memberships.user_id) = 2")
                        .first

    return chat_room if chat_room

    transaction do
      chat_room = ChatRoom.create!(
        name: "#{user1.name} & #{user2.name}",
        is_private: true,
        created_by: user1
      )

      chat_room.chat_room_memberships.create!([
                                                { user: user1 },
                                                { user: user2 }
                                              ])

      chat_room
    end
  end
end
