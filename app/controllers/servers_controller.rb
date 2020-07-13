# frozen_string_literal: true

# Servers Controller
# Handles display of Servers table as well as a method to allow current clients
# to post their server availablility
class ServersController < ApplicationController
  include Trackable

  skip_before_action :verify_authenticity_token, only: :announce

  # GET /servers
  def index
    render locals: { servers: Server.all }
  end

  # POST /servers/announce
  def announce
    key = params[:key]

    if Server.exists?(server_key: key)
      server = Server.where(server_key: key).first
      server.update(server_params)
    else
      server = Server.new(server_params)
    end

    if server.save
      render plain: server.server_key, layout: false, status: 202
    else
      head 422
    end
  end

  private

  def server_params
    {
      ip_address: remote_ip,
      port:       params[:port],
      version:    params[:version],
      phase:      (params[:close].present? ? 'Closed' : 'Lobby'),
      passworded: params[:pw].present?,
      users:      players_string
    }
  end

  def players_string
    params[:players].sort.join(', ')
  rescue StandardError
    ''
  end
end
