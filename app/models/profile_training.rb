# encoding: utf-8
class ProfileTraining < ActiveRecord::Base
  has_one :training, dependent: :destroy
  accepts_nested_attributes_for :training, :allow_destroy => true
  
  belongs_to :created_by, :class_name => 'Employee', :foreign_key => 'created_by'
  
  belongs_to :training_goal
  
  validates :name, :training_goal, presence: true
  validates :name, uniqueness: true
  
  attr_accessible :name, :training_goal, :training_goal_id, :created_by, :training_attributes
  
  
  # Static method
  # Return number of profile trainings which his training_goal_id is equal to the value given
  def self.size_by_training_goal(training_goal_id)
    return ProfileTraining.where(training_goal_id: training_goal_id).size
  end
  
end
