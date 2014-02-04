# encoding: utf-8
class Workout < ActiveRecord::Base
  #self.table_name 'bodybuilder.workout'
  has_many :training_workouts
  has_many :trainings, through: :training_workout
  
  belongs_to :equipment
  belongs_to :physical_category
  
  attr_accessible :description, :physical_category_id
  
  validates :description, presence: true
end
