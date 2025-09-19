class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :content, presence: true, length: { maximum: 200 }
  validates :message_type, inclusion: { in: %w(text system) }

  scope :recent, -> { order(created_at: :desc) }
  scope :in_room, ->(room_id) { where(chat_room_id: room_id) }
  scope :for_display, -> { order(created_at: :asc) }

  after_create_commit { broadcast_message }

  private

  def broadcast_message
    ActionCable.server.broadcast(
      "chat_room_#{chat_room.id}",
      {
        id: id,
        content: content,
        user: {
          id: user.id,
          name: user.name,
        },
        created_at: created_at.strftime("%H:%M"),
        message_type: message_type
      }
    )
  end
end
