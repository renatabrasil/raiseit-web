class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      # t.string :code, limit: 30
      t.string :description, limit: 200
      t.integer :usability
      t.integer :quantity
      t.timestamp :next_maintenance_date
      
      # Foreign key
      t.belongs_to :status_equipment
      t.belongs_to :modality

      t.timestamps
    end
  end
end
