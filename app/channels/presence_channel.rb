class PresenceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "presence"

    # Broadcast that user is online to all relevant chat rooms
    current_user.chat_rooms.each do |chat_room|
      ActionCable.server.broadcast(
        "chat_room_#{chat_room.id}",
        {
          type: "user_status",
          user_id: current_user.id,
          status: "online"
        }
      )
    end
  end

  def unsubscribed
    # Broadcast that user is offline to all relevant chat rooms
    current_user.chat_rooms.each do |chat_room|
      ActionCable.server.broadcast(
        "chat_room_#{chat_room.id}",
        {
          type: "user_status",
          user_id: current_user.id,
          status: "offline"
        }
      )
    end
  end
end