# encoding: utf-8
class Workout < ActiveRecord::Base
  #self.table_name 'bodybuilder.workout'
  has_many :training_workout
  has_many :training, through: :training_workout
end
