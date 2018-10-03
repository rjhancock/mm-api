class CreateComponentsFactories < ActiveRecord::Migration[5.2]
  def change
    create_table :components_factories, id: false do |t|
      t.belongs_to :component, index: true
      t.belongs_to :factory, index: true
    end
  end
end
