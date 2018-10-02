class CreateSystemOwnerEras < ActiveRecord::Migration[5.2]
  def change
    create_table :system_owner_eras do |t|
      t.integer :era
      t.string :faction
      t.references :system, foreign_key: true

      t.timestamps
    end
  end
end
