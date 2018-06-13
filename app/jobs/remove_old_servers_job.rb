# frozen_string_literal: true

# Remove Old Servers Job
# Removes all servers that haven't been updated in over an hour.
class RemoveOldServersJob < ApplicationJob
  queue_as :default

  def perform
    Server.where("updated_at < :hour_ago", { hour_ago: 1.hour.ago }).delete_all
  end
end
