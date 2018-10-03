# == Schema Information
#
# Table name: publishers
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Publisher < ApplicationRecord
  has_many :publications, dependent: :destroy
  has_many :books, through: :publications
end
