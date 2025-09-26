class CleanupStalePresenceJob < ApplicationJob
  queue_as :default

  def perform
    Rails.logger.info "Starting cleanup of stale presence connections..."
    User.cleanup_stale_connections!
    Rails.logger.info "Finished cleanup of stale presence connections"

    # Schedule the next cleanup in 2 minutes
    CleanupStalePresenceJob.set(wait: 2.minutes).perform_later
  end
end