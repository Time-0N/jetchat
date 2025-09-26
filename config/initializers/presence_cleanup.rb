# Start the recurring presence cleanup job
Rails.application.config.after_initialize do
  # Schedule the first cleanup job to start the recurring cycle
  CleanupStalePresenceJob.set(wait: 2.minutes).perform_later
end