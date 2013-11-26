class CreateTrainingWorkouts < ActiveRecord::Migration
  def change
    create_table :training_workouts do |t|
      t.integer :series
      t.integer :repetitions
      t.datetime :duration
      t.float :load
      
      # Foreign key
      t.belongs_to :training
      t.belongs_to :workout

      t.timestamps
    end
  end
end
