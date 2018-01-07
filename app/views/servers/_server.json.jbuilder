json.extract! server, :id, :port, :ip_address, :passworded, :users, :server_key, :created_at, :updated_at
json.url server_url(server, format: :json)
