class AddFieldsToUnits < ActiveRecord::Migration[5.2]
  def change
    add_column :units, :overview, :text
    add_column :units, :capabilites, :text
    add_column :units, :deployment, :text
    add_column :units, :notable_units, :text
    add_column :units, :mechwarrior_rules, :text
  end
end
