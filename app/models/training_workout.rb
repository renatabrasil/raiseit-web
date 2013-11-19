# encoding: utf-8
class TrainingWorkout < ActiveRecord::Base
  belongs_to :workout
  belongs_to :training
end
