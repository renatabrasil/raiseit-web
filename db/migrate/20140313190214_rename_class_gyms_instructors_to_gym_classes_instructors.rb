class RenameClassGymsInstructorsToGymClassesInstructors < ActiveRecord::Migration
  def change
    rename_table :class_gyms_instructors, :gym_classes_instructors
    change_table :gym_classes_instructors do |t|
      t.rename :class_gym_id, :gym_class_id
    end
  end
end
