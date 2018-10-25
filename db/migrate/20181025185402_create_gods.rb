class CreateGods < ActiveRecord::Migration[5.2]
  def change
    create_table :gods do |t|
      t.string :name
      t.integer :popularity
      t.string :pantheon
      t.string :url

      t.timestamps
    end
  end
end
