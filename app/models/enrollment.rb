# encoding: utf-8
class Enrollment < ActiveRecord::Base
  belongs_to :student, :class_name => 'Student', :foreign_key => 'student_id'
  
end
