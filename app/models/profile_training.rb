# encoding: utf-8
class ProfileTraining < ActiveRecord::Base
  has_one :training
  accepts_nested_attributes_for :training, :allow_destroy => true
  
  belongs_to :created_by, :class_name => 'Instructor', :foreign_key => 'created_by'
  
  belongs_to :training_goal
  
  attr_accessible :name, :training_attributes
end
