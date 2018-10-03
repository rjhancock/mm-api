class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.string :chapter
      t.date :chapter_date
      t.references :system
      t.references :novel

      t.timestamps
    end
  end
end
