class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    chat_room = ChatRoom.find(params[:chat_room_id])

    if current_user.chat_rooms.include?(chat_room)
      stream_from "chat_room_#{chat_room.id}"
    else
      reject
    end
  end

  def unsubscribed
  end

  def receive(data)
    chat_room = ChatRoom.find(params[:chat_room_id])

    if current_user.chat_rooms.include?(chat_room)
      Rails.logger.info "Creating message with content: '#{data['message']}'"

      begin
        message = chat_room.messages.create!(
          user: current_user,
          content: data["message"].to_s.strip,
          message_type: "text"
        )

        # Auto-mark as read for the sender
        membership = chat_room.chat_room_memberships.find_by(user: current_user)
        membership&.update!(last_read_at: Time.current)

        Rails.logger.info "Message created successfully: #{message.inspect}"
      rescue => e
        Rails.logger.error "Message creation failed: #{e.message}"
        Rails.logger.error "Data received: #{data.inspect}"
      end
    end
  end

  def typing
    chat_room_id = params[:chat_room_id]
    ActionCable.server.broadcast(
      "chat_room_#{chat_room_id}",
      {
        type: "typing",
        user_id: current_user.id,
        user_name: current_user.name,
        typing: true
      }
    )
  end

  def stop_typing
    chat_room_id = params[:chat_room_id]
    ActionCable.server.broadcast(
    "chat_room_#{chat_room_id}",
    {
      type: "typing",
      user_id: current_user.id,
      typing: false
    }
    )
  end
end
