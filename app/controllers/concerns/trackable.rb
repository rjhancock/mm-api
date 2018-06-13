# frozen_string_literal: true
# Trackable
# Utility methods for gathering basic data from calls.
module Trackable
  include ActiveSupport::Concern

  # Returns the remote IP. Localhost address if not available
  def remote_ip
    ip = request.remote_ip
    ip = '127.0.0.1' if ip.blank?
    ip
  end
end
