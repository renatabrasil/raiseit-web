class RenameClassGymsPeopleToGymClassesStudents < ActiveRecord::Migration
  def change
    rename_table :class_gyms_people, :gym_classes_students
    change_table :gym_classes_students do |t|
      t.rename :class_gym_id, :gym_class_id
    end
  end
end
