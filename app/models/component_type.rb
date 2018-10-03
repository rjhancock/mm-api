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

class ComponentType < ApplicationRecord
end
