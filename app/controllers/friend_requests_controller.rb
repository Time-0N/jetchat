class FriendRequestsController < ApplicationController
  before_action :find_friend_request, only: [ :accept, :decline ]

  def index
    @received_requests = current_user.received_friend_requests
                                     .pending
                                     .includes(:sender)
                                     .order(created_at: :desc)

    @sent_requests = current_user.sent_friend_requests
                                 .pending
                                 .includes(:receiver)
                                 .order(created_at: :desc)
  end

  def create
    @receiver = User.find(params[:receiver_id])
    @friend_request = current_user.send_friend_request(@receiver, params[:message])

    if @friend_request&.persisted?
      respond_to do |format|
        format.html { redirect_back(fallback_location: discover_friends_path, notice: "Friend request sent!") }
        format.json { render json: { status: "success", message: "Friend request sent!" } }
      end
    else
      error_message = @friend_request&.errors&.full_messages&.first || "Unable to send friend request"
      respond_to do |format|
        format.html { redirect_back(fallback_location: discover_friends_path, alert: error_message) }
        format.json { render json: { status: "error", message: error_message }, status: :unprocessable_entity }
      end
    end
  end

  def accept
    if @friend_request.accept!
      respond_to do |format|
        format.html { redirect_to friend_requests_path, notice: "Friend request accepted!" }
        format.json { render json: { status: "success", message: "Friend request accepted!" } }
      end
    else
      respond_to do |format|
        format.html { redirect_to friend_requests_path, alert: "Unable to accept friend request" }
        format.json { render json: { status: "error", message: "Unable to accept friend request" }, status: :unprocessable_entity }
      end
    end
  end

  def decline
    if @friend_request.decline!
      respond_to do |format|
        format.html { redirect_to friend_requests_path, notice: "Friend request declined" }
        format.json { render json: { status: "success", message: "Friend request declined" } }
      end
    else
      respond_to do |format|
        format.html { redirect_to friend_requests_path, alert: "Unable to decline friend request" }
        format.json { render json: { status: "error", message: "Unable to decline friend request" }, status: :unprocessable_entity }
      end
    end
  end

  private

  def find_friend_request
    @friend_request = current_user.received_friend_requests.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    respond_to do |format|
      format.html { redirect_to friend_requests_path, alert: "Friend request not found" }
      format.json { render json: { status: "error", message: "Friend request not found" }, status: :not_found }
    end
  end
end
