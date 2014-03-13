class RenameClassGymsToGymClasses < ActiveRecord::Migration
  def change
    rename_table :class_gyms, :gym_classes
  end
end
