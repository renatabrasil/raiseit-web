class RemoveNextMaintenanceDateFromEquipment < ActiveRecord::Migration
  def change
    remove_column :equipment, :next_maintenance_date, :datetime
  end
end
