class CreateComponents < ActiveRecord::Migration[5.2]
  def change
    create_table :components do |t|
      t.string :name
      t.references :component_type, foreign_key: true

      t.timestamps
    end

    add_index :components, [:name, :component_type_id]
  end
end
