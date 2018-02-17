class ServersController < ApplicationController
  include Trackable

  # GET /servers
  def index
    @servers = Server.all
  end

  # POST /servers/announce
  def announce
    server_params = {
      ip_address: remote_ip,
      port:       params[:port],
      version:    params[:version]
    }

    server_params[:users]       = params[:players].join(', ') if params[:players].present?
    server_params[:phase]       = params[:close].present? ? 'Closed' : 'Lobby'
    server_params[:passworded]  = params[:pw].present?

    if params[:key].present? && Server.exists?(server_key: params[:key])
      server = Server.where(server_key: params[:key]).first
      server.update_attributes(server_params)
    else
      server = Server.new(server_params)
    end

    if server.save
      render plain: server.server_key, layout: false, status: 201
    else
      head 422
    end
  end
end
