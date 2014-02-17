class FixColumnsTrainingWorkout < ActiveRecord::Migration
  class TrainingWorkout < ActiveRecord::Base
  end
  def change
    change_table :training_workouts do |t|
      TrainingWorkout.reset_column_information
      TrainingWorkout.all.each do |p|
        p.update_attribute(:duration, '')
      end
      #t.change :duration, :integer
      t.remove :duration
      t.string :duration
    end
  end
end
