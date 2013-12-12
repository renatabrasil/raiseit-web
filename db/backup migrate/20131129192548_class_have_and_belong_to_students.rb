class ClassHaveAndBelongToStudents < ActiveRecord::Migration
  def self.up
    create_table :class_gyms_people, :id => false do |t|
      # t.references :class_gym, :student
      t.belongs_to :class_gym
      t.integer :student_id, :references => "people"
    end
  end
 
  def self.down
    drop_table :class_gyms_people
  end
end
