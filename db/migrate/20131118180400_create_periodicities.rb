class CreatePeriodicities < ActiveRecord::Migration
  def change
    create_table :periodicities do |t|
      t.string :description, limit: 120

      t.timestamps
    end
  end
end
