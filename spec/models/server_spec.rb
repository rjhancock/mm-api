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
#  version    :string
#  phase      :string
#  motd       :string
#
# Indexes
#
#  index_servers_on_server_key  (server_key) UNIQUE
#

require 'rails_helper'

RSpec.describe Server, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
