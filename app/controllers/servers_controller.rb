class ServersController < ApplicationController
  # GET /servers
  # GET /servers.json
  def index
    @servers = Server.all
  end

  # POST /servers.json
  def create
    @server = Server.new(server_params)
    @server.ip_address = remote_ip

    if @server.save
      render json: @server, status: :created
    else
      render json: @server.errors, status: :unprocessable_entity
    end
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

    server.save
    render plain: server.server_key, layout: false
  end

  # PATCH/PUT /servers/1.json
  def update
    if server.update(server_params)
      head :ok
    else
      render json: @server.errors, status: :unprocessable_entity
    end
  end

  # DELETE /servers/1.json
  def destroy
    server.destroy
    head :ok
  end

  private
  def server
    @server ||= Server.where(server_key: params[:id]).first
  end

  def server_params
    params.require(:server).permit(
      :port,
      :passworded,
      :users,
      :version,
      :phase,
      :motd
    )
  end
end
