class DashboardController < ApplicationController
  def index
    @pending_friend_requests_count = current_user.pending_friend_requests_count
    @unread_messages_count = current_user.unread_messages_count
    @recent_friends = current_user.all_friends.limit(5)
  end
end
