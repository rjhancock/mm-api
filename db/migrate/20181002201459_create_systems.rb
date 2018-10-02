class CreateSystems < ActiveRecord::Migration[5.2]
  def change
    create_table :systems do |t|
      t.string :name
      t.text :description
      t.decimal :coords_x
      t.decimal :coords_y
      t.string :time_to_jump
      t.string :url
      t.timestamps
    end

    add_index :systems, [:name, :url]
  end
end
