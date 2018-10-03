# == Schema Information
#
# Table name: novels
#
#  id            :bigint(8)        not null, primary key
#  title         :string
#  description   :text
#  author_id     :bigint(8)
#  series        :string
#  prologue_date :date
#  start_date    :date
#  end_date      :date
#  epilogue_date :date
#  url           :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_novels_on_author_id  (author_id)
#

require 'rails_helper'

RSpec.describe Novel, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
