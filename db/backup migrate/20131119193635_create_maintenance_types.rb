class CreateMaintenanceTypes < ActiveRecord::Migration
  def change
    create_table :maintenance_types do |t|
      t.string :description, limit: 200

      t.timestamps
    end
  end
end
