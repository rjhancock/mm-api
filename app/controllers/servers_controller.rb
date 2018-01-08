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
    params.require(:server).permit(:port, :passworded, :users)
  end
end
