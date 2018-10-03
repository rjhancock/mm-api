# == Schema Information
#
# Table name: component_types
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_component_types_on_name  (name)
#

require 'rails_helper'

RSpec.describe ComponentType, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
