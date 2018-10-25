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

require 'open-uri'

class God < ApplicationRecord
  validates :name, uniqueness: { scope: [:pantheon] }

  before_save :update_popularity

  private

  def update_popularity
    return if self.url.blank?

    raw = open(self.url).read
    index = raw.match(/Popularity index.+ (\d+)/i)
    return if index.blank?

    self.popularity = index[1].to_i
  end
end
