class RemoveUsabilityFromEquipments < ActiveRecord::Migration
  def change
    remove_column :equipment, :usability, :integer
  end
end
