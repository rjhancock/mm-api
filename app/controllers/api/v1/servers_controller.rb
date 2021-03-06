# frozen_string_literal: true

# ServersController
# API endpoint for grabing a list of servers currently open to accepting
# a MegaMek client, adding to the list, updating existing ones, etc.
class Api::V1::ServersController < Api::ApiController
  include Trackable

  # GET /servers.json
  def index
    render locals: { servers: Server.all }
  end

  # POST /servers.json
  def create
    server = Server.new(server_params)
    server.ip_address = remote_ip

    if server.save
      render json: server, status: :created
    else
      render json: server.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /servers/1.json
  def update
    if server && server.update(server_params)
      head :accepted
    else
      head :unprocessable_entity
    end
  end

  # DELETE /servers/1.json
  def destroy
    server.destroy
    head :ok
  end

  private

  def server
    @server ||= Server.find_by(server_key: params[:id])
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
