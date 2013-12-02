# encoding: utf-8
class ClassGym < ActiveRecord::Base
  belongs_to :modality
  belongs_to :instructor, :class_name => 'Instructor', :foreign_key => 'instructor_id'
  
  has_and_belongs_to_many :students
    
  attr_accessible :schedule, :capacity, :modality_id, :instructor_id
end
