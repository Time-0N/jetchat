class MessagesController < ApplicationController
  def create
    @chat_room = ChatRoom.find(params[:chat_room_id])

    unless @chat_room.users.include?(current_user)
      render json: { error: "Unauthorized" }, status: :forbidden
      return
    end

    @message = @chat_room.messages.build(message_params)
    @message.user = current_user

    if @message.save
      render json: {
        status: "success",
        message: {
          id: @message.id,
          content: @message.content,
          created_at: @message.created_at.strftime("%H:%M")
        }
      }
    else
      render json: {
        error: @message.errors.full_messages.first
      }, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :message_type)
  end
end
