class CreateFactories < ActiveRecord::Migration[5.2]
  def change
    create_table :factories do |t|
      t.string :name
      t.references :system, foreign_key: true
      t.string :url

      t.timestamps
    end

    add_index :factories, [:name, :url]
  end
end
