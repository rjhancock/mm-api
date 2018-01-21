class AddMotdToServer < ActiveRecord::Migration[5.1]
  def change
    add_column :servers, :motd, :string
  end
end
