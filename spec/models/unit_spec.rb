# == Schema Information
#
# Table name: units
#
#  id               :bigint(8)        not null, primary key
#  title            :string
#  source_file_name :string
#  unit_type        :integer          default("mech")
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_units_on_title  (title)
#

require 'rails_helper'

RSpec.describe Unit, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
