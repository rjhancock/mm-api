# Base class for all controllers
class ApplicationController < ActionController::Base
  def remote_ip
    ip = request.remote_ip
    ip = '127.0.0.1' if ip.blank?
    ip
  end
end
