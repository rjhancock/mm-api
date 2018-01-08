# Base class for all controllers
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def remote_ip
    ip = request.remote_ip
    ip = '127.0.0.1' if ip.blank?
    ip
  end
end
