# encoding: utf-8
class TrainingWorkout < ActiveRecord::Base
  belongs_to :workout
  belongs_to :training
  
  attr_accessible :series, :repetitions, :duration, :load, :workout_id, :training_id,
    :workout
  
end
