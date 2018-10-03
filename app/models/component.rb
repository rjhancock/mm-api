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

class Component < ApplicationRecord
  belongs_to :component_type
  has_and_belongs_to_many :factories
end
