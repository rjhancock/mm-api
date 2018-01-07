# == Schema Information
#
# Table name: servers
#
#  id         :integer          not null, primary key
#  port       :integer
#  ip_address :string
#  passworded :boolean
#  users      :text
#  server_key :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_servers_on_server_key  (server_key) UNIQUE
#

class Server < ApplicationRecord
  has_secure_token :server_key
end
