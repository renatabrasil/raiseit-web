# encoding: utf-8
class WorkoutSheet < ActiveRecord::Base

  has_many :trainings, dependent: :destroy
  belongs_to :student, :class_name => 'Student', :foreign_key => 'student_id'
  belongs_to :instructor, :class_name => 'Employee', :foreign_key => 'instructor_id'
  belongs_to :training_goal
  belongs_to :model_workout_sheet
  
  accepts_nested_attributes_for :trainings, :allow_destroy => true
  
  validates :training_goal, :instructor, :student, presence: true
  
  attr_accessible :active, :expiration_date, :training_goal_id, :instructor_id, 
    :student_id, :trainings_attributes
  
end
