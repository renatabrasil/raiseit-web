class CreateWorkoutSheets < ActiveRecord::Migration
  def change
    create_table :workout_sheets do |t|
      
      t.datetime :expiration_date
      t.boolean :active
      
      # Foreign key
      t.belongs_to :model_workout_sheet
      t.belongs_to :training_goal
      t.integer :student_id, :references => "people"
      t.integer :instructor_id, :references => "people"

      t.timestamps
    end
  end
end
