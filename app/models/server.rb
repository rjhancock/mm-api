# frozen_string_literal: true
# == Schema Information
#
# Table name: servers
#
#  id         :bigint(8)        not null, primary key
#  port       :integer
#  ip_address :string
#  passworded :boolean
#  users      :text
#  server_key :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  version    :string
#  phase      :string
#  motd       :string
#
# Indexes
#
#  index_servers_on_server_key  (server_key) UNIQUE
#

# Server
# Server model for storing currently active servers and their relative
# information.
class Server < ApplicationRecord
  has_secure_token :server_key

  validates :port, :ip_address, :version, :phase, presence: true
  validates :port, numericality: { only_integer: true, greater_than: 1024 }
end
