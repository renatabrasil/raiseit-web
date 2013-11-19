# encoding: utf-8
class Training < ActiveRecord::Base
  has_many :training_workout
  has_many :workout, through: :training_workout 
end
