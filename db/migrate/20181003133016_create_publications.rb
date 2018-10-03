class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.integer :stock_number
      t.string :isbn
      t.integer :year
      t.decimal :price
      t.references :publisher
      t.references :novel

      t.timestamps
    end
  end
end
