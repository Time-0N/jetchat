class DashboardController < ApplicationController
  def index
    @pending_friend_requests_count = current_user.pending_friend_requests_count
    @recent_friends = current_user.all_friends.limit(5)
  end
end
