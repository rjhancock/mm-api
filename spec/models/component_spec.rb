# == Schema Information
#
# Table name: components
#
#  id                :bigint(8)        not null, primary key
#  name              :string
#  component_type_id :bigint(8)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_components_on_component_type_id           (component_type_id)
#  index_components_on_name_and_component_type_id  (name,component_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (component_type_id => component_types.id)
#

require 'rails_helper'

RSpec.describe Component, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
