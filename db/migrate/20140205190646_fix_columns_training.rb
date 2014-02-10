class FixColumnsTraining < ActiveRecord::Migration
  class Training < ActiveRecord::Base
  end
  # If it fails, try to change 'change' to 'up'
  def change
    change_table :trainings do |t|
      t.remove :expiration_date, :active, :student_id, :instructor_id, :training_goal_id
      # If this part fails, you should try to add to the sentence this -> :limit => 1
      t.string :training_type
      
      # Foreign key
      t.belongs_to :workout_sheet
      
      Training.reset_column_information
      # Training.update_all(:training_type => 'A')
      Training.all.each do |p|
        p.update_attribute(:training_type, 'A')
      end
    end
    change_column :trainings, :training_type, :string, :limit => 1, :null => false
  end
end
