class CreateSystemOccupationDates < ActiveRecord::Migration[5.2]
  def change
    create_table :system_occupation_dates do |t|
      t.string :faction
      t.date :occupation_start
      t.references :system, foreign_key: true

      t.timestamps
    end
  end
end
