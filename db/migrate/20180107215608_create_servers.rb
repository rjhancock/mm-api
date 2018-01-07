class CreateServers < ActiveRecord::Migration[5.1]
  def change
    create_table :servers do |t|
      t.integer :port
      t.string :ip_address
      t.boolean :passworded
      t.text :users
      t.string :server_key

      t.timestamps
    end

    add_index :servers, :server_key, unique: true
  end
end
