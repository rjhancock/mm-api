class CreateJoinTableSystemsUnits < ActiveRecord::Migration[5.2]
  def change
    create_join_table :systems, :units do |t|
      t.index [:system_id, :unit_id], unique: true
    end
  end
end
