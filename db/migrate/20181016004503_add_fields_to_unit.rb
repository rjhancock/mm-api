class AddFieldsToUnit < ActiveRecord::Migration[5.2]
  def change
    add_column :units, :appearance, :string
    add_column :units, :armament, :string
    add_column :units, :armor_type, :string
    add_column :units, :available, :string
    add_column :units, :communication_system, :string
    add_column :units, :config, :string
    add_column :units, :cruise_speed, :string
    add_column :units, :jump_jets, :string
    add_column :units, :maximum_speed, :string
    add_column :units, :power_plant, :string
    add_column :units, :rules, :string
    add_column :units, :source, :string
    add_column :units, :targeting_tracking_system, :string
    add_column :units, :tech_level, :string
    add_column :units, :tonnage, :string
    add_column :units, :used_by, :string
  end
end
