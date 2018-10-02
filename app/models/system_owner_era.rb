# == Schema Information
#
# Table name: system_owner_eras
#
#  id         :bigint(8)        not null, primary key
#  era        :integer
#  faction    :string
#  system_id  :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_system_owner_eras_on_system_id  (system_id)
#
# Foreign Keys
#
#  fk_rails_...  (system_id => systems.id)
#

class SystemOwnerEra < ApplicationRecord
  belongs_to :system
end
