# == Schema Information
#
# Table name: publications
#
#  id           :bigint(8)        not null, primary key
#  stock_number :integer
#  isbn         :string
#  year         :integer
#  price        :decimal(, )
#  publisher_id :bigint(8)
#  novel_id     :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_publications_on_novel_id      (novel_id)
#  index_publications_on_publisher_id  (publisher_id)
#

require 'rails_helper'

RSpec.describe Publication, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
