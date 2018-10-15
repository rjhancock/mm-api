class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.string :title
      t.string :source_file_name
      t.integer :unit_type, default: 0

      t.timestamps
    end

    add_index :units, :title
  end
end
