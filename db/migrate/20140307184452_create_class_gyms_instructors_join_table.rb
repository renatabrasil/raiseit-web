class CreateClassGymsInstructorsJoinTable < ActiveRecord::Migration
  def change
    create_table :class_gyms_instructors, id: false do |t|
      t.integer :class_gym_id
      t.integer :instructor_id, :references => "people"
    end
  end
end
