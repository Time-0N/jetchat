class ChatRoomMembership < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :user_id, uniqueness: { scope: :chat_room_id }

  def mark_as_read!
    update!(last_read_at: Time.current)
  end
end
