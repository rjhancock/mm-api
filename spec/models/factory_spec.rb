# == Schema Information
#
# Table name: factories
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  system_id  :bigint(8)
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_factories_on_name_and_url  (name,url)
#  index_factories_on_system_id     (system_id)
#
# Foreign Keys
#
#  fk_rails_...  (system_id => systems.id)
#

require 'rails_helper'

RSpec.describe Factory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
