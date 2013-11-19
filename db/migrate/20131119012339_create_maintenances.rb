class CreateMaintenances < ActiveRecord::Migration
  def change
    create_table :maintenances do |t|
      t.timestamp :date
      t.column :value, :numeric, :precision => 6, :scale => 2
      t.string :technical_feedback
      
      # Foreign key
      t.belongs_to :equipment
      t.belongs_to :maintenance_type

      t.timestamps
    end
  end
end
