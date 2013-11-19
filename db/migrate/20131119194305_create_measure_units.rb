class CreateMeasureUnits < ActiveRecord::Migration
  def change
    create_table :measure_units do |t|
      t.string :description, limit: 200

      t.timestamps
    end
  end
end
