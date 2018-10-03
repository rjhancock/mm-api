class CreateComponentTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :component_types do |t|
      t.string :name

      t.timestamps
    end

    add_index :component_types, :name
  end
end
