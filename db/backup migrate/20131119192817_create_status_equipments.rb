class CreateStatusEquipments < ActiveRecord::Migration
  def change
    create_table :status_equipments do |t|
      t.string :description, limit: 200

      t.timestamps
    end
  end
end