class AddVersionAndPhaseToServer < ActiveRecord::Migration[5.1]
  def change
    add_column :servers, :version, :string
    add_column :servers, :phase, :string
  end
end
