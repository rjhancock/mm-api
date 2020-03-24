Rails.application.config.active_job.queue_adapter = :sidekiq
Rails.application.config.active_job.queue_name_prefix = "megamek_api_#{Rails.env}"

REDIS_URL = 'redis://localhost:6379/0'

redis_config = REDIS_URL.present? ? { url: REDIS_URL, driver: :hiredis } : { driver: :hiredis }

Sidekiq.configure_server do |config|
  config.redis = redis_config
end

Sidekiq.configure_client do |config|
  config.redis = redis_config
end
