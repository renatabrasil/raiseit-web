class CreateModelWorkoutSheets < ActiveRecord::Migration
  def change
    create_table :model_workout_sheets do |t|
      t.string :name

      t.timestamps
    end
  end
end
