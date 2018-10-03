class CreateNovels < ActiveRecord::Migration[5.2]
  def change
    create_table :novels do |t|
      t.string :title
      t.text :description
      t.references :author
      t.string :series
      t.date :prologue_date
      t.date :start_date
      t.date :end_date
      t.date :epilogue_date
      t.string :url
      t.timestamps
    end
  end
end
