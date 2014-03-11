# encoding: utf-8
class ClassGym < ActiveRecord::Base
  belongs_to :modality
  belongs_to :instructor, :class_name => 'Employee', :foreign_key => 'instructor_id'
  # has_many :enrollments, dependent: :destroy
  
  has_and_belongs_to_many :students
    
  attr_accessible :schedule, :capacity, :modality_id, :instructor_id, :student_ids, :open, :start_date
  
  accepts_nested_attributes_for :students, :allow_destroy => true
  
  def calendar_days
    today = Date.today
    if !self.start_date.blank?
    end
    return self.start_date.blank? ? 0 : (self.start_date.to_date > today ? 0 : (today - self.start_date.to_date).to_i)
  end
end
