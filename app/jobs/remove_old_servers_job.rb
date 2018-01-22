class RemoveOldServersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Server.where("updated_at < :hour_ago", { hour_ago: 1.hour.ago }).delete_all
  end
end
