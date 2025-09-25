class ChatRoomMembership < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :user_id, uniqueness: { scope: :chat_room_id }

  def mark_as_read!
    update!(last_read_at: Time.current)
    broadcast_unread_count_update
  end

  private

  def broadcast_unread_count_update
    # Temporarily disabled due to ActionCable/Solid Cable insert_all issue
    return

    unread_count = user.unread_messages_count

    ActionCable.server.broadcast(
      "user_notifications_#{user.id}",
      {
        type: "unread_messages_update",
        unread_count: unread_count
      }
    )
  end
end
