# frozen_string_literal: true

json.extract! server, :port, :ip_address, :passworded, :users, :version,
              :phase, :motd, :created_at, :updated_at
