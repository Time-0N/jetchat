class FriendsController < ApplicationController
  def index
    @friends = current_user.all_friends.includes(:friendships)
    @pending_requests_count = current_user.pending_friend_requests_count

    @friendships_data = {}
    current_user.friendships.includes(:friend).each do |friendship|
      @friendships_data[friendship.friend_id] = friendship
    end
    current_user.inverse_friendships.includes(:user).each do |friendship|
      @friendships_data[friendship.user_id] = friendship
    end
  end

  def discover
    @page = params[:page]&.to_i || 1
    @per_page = 10

    if params[:search].present?
      @users = User.search_by_name(params[:search], limit: @per_page)
      @is_search = true
    else
      @users = User.for_discovery(current_user, page: @page, per_page: @per_page)
      @is_search = false
    end

    @friendship_status = {}
    @users.each do |user|
      @friendship_status[user.id] = friendship_status_for(user)
    end

    respond_to do |format|
      format.html
      format.json do
        render json: {
          users: @users.as_json(only: [ :id, :name, :first_name, :last_name, :email ]),
          friendship_status: @friendship_status,
          page: @page,
          has_more: !@is_search && @users.count == @per_page
        }
      end
    end
  end

  private

  def friendship_status_for(user)
    return "self" if user == current_user
    return "friends" if current_user.friends_with?(user)

    sent_request = current_user.sent_friend_requests.pending.find_by(receiver: user)
    received_request = current_user.received_friend_requests.pending.find_by(sender: user)

    return "request_sent" if sent_request
    return "request_received" if received_request

    "none"
  end
end
