class CreateJoinTableFactoriesUnits < ActiveRecord::Migration[5.2]
  def change
    create_join_table :factories, :units do |t|
      t.index [:factory_id, :unit_id], unique: true
    end
  end
end
