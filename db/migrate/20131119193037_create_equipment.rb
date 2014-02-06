class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      # t.string :code, limit: 30
      t.string :description, limit: 200
      t.datetime :next_maintenance_date
      t.integer :quantity
      
      # Não disponível para a primeira release
      t.integer :usability
      
      # Foreign key
      t.belongs_to :status_equipment
      t.belongs_to :modality

      t.timestamps
    end
  end
end
