# == Schema Information
#
# Table name: chapters
#
#  id           :bigint(8)        not null, primary key
#  chapter      :string
#  chapter_date :date
#  system_id    :bigint(8)
#  novel_id     :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_chapters_on_novel_id   (novel_id)
#  index_chapters_on_system_id  (system_id)
#

class Chapter < ApplicationRecord
  belongs_to :novel
  belongs_to :system
end
