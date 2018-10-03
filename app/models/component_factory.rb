# == Schema Information
#
# Table name: component_factories
#
#  component_id :bigint(8)
#  factory_id   :bigint(8)
#
# Indexes
#
#  index_component_factories_on_component_id  (component_id)
#  index_component_factories_on_factory_id    (factory_id)
#
# Foreign Keys
#
#  fk_rails_...  (component_id => components.id)
#  fk_rails_...  (factory_id => factories.id)
#

class ComponentFactory < ApplicationRecord
  belongs_to :component
  belongs_to :factory
end
