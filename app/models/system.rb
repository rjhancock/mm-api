# == Schema Information
#
# Table name: systems
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  description  :text
#  coords_x     :decimal(, )
#  coords_y     :decimal(, )
#  time_to_jump :string
#  url          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_systems_on_name_and_url  (name,url)
#

class System < ApplicationRecord
  has_many :system_owner_eras, dependent: :destroy
  has_many :system_occupation_dates, dependent: :destroy
  has_many :factories, dependent: :destroy
  has_many :chapters
  has_many :books, through: :chapters

  has_and_belongs_to_many :units
end
