# == Schema Information
#
# Table name: system_occupation_dates
#
#  id               :bigint(8)        not null, primary key
#  faction          :string
#  occupation_start :date
#  system_id        :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_system_occupation_dates_on_system_id  (system_id)
#
# Foreign Keys
#
#  fk_rails_...  (system_id => systems.id)
#

require 'rails_helper'

RSpec.describe SystemOccupationDate, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
