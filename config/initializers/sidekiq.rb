Rails.application.config.active_job.queue_adapter = :sidekiq
Rails.application.config.active_job.queue_name_prefix = "megamek_api_#{Rails.env}"

Sidekiq.configure_server do |config|
  config.redis = { driver: :hiredis }
end

Sidekiq.configure_client do |config|
  config.redis = { driver: :hiredis }
end
