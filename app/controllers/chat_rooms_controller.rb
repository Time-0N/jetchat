class ChatRoomsController < ApplicationController
  before_action :find_chat_room, only: [ :show, :mark_as_read ]

  def index
    @chat_rooms = current_user.chat_rooms
                              .includes(:users, :messages)
                              .order("messages.created_at DESC NULLS LAST")
    @unread_counts = {}
    @chat_rooms.each do |room|
      @unread_counts[room.id] = room.unread_count_for_user(current_user)
    end
  end

  def show
    unless @chat_room.users.include?(current_user)
      redirect_to chat_rooms_path, alert: "You don't have access to this chat room"
      return
    end

    membership = @chat_room.chat_room_memberships.find_by(user: current_user)
    membership&.mark_as_read!

    @messages = @chat_room.messages
                          .includes(:user)
                          .for_display
                          .limit(50)

    @other_user = @chat_room.other_user(current_user) if @chat_room.is_private?

    @current_user_id = current_user.id
  end

  def create_private_chat
    friend = User.find(params[:friend_id])

    unless current_user.can_chat_with?(friend)
      respond_to do |format|
        format.json { render json: { error: "You can only chat with friends" }, status: :forbidden }
        format.html { redirect_back(fallback_location: friends_path, alert: "You can only chat with friends") }
      end
      return
    end

    @chat_room = ChatRoom.private_chat_between(current_user, friend)

    respond_to do |format|
      format.json { render json: { chat_room_id: @chat_room.id, redirect_url: chat_room_path(@chat_room) } }
      format.html { redirect_to @chat_room }
    end
  end

  def mark_as_read
    unless @chat_room.users.include?(current_user)
      render json: { error: "Access denied" }, status: :forbidden
      return
    end

    membership = @chat_room.chat_room_memberships.find_by(user: current_user)
    membership&.update!(last_read_at: Time.current)

    render json: { success: true }
  end

  private

  def find_chat_room
    @chat_room = ChatRoom.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    respond_to chat_rooms_path, aler: "Chat room not found"
  end
end
