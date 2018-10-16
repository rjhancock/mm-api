# == Schema Information
#
# Table name: units
#
#  id                        :bigint(8)        not null, primary key
#  title                     :string
#  source_file_name          :string
#  unit_type                 :integer          default("mech")
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  appearance                :string
#  armament                  :string
#  armor_type                :string
#  available                 :string
#  communication_system      :string
#  config                    :string
#  cruise_speed              :string
#  jump_jets                 :string
#  maximum_speed             :string
#  power_plant               :string
#  rules                     :string
#  source                    :string
#  targeting_tracking_system :string
#  tech_level                :string
#  tonnage                   :string
#  used_by                   :string
#  overview                  :text
#  capabilites               :text
#  deployment                :text
#  notable_units             :text
#  mechwarrior_rules         :text
#
# Indexes
#
#  index_units_on_title  (title)
#

require 'rails_helper'

RSpec.describe Unit, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
