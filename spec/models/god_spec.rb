# == Schema Information
#
# Table name: gods
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  popularity :integer
#  pantheon   :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe God, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
