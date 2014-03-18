# encoding: utf-8
class ClassGym < ActiveRecord::Base
  belongs_to :modality
  belongs_to :instructor, :class_name => 'Instructor', :foreign_key => 'instructor_id'
  
  has_many :schedules, dependent: :destroy
  accepts_nested_attributes_for :schedules, reject_if: proc { |attributes| attributes['week_day'].blank? } 
  
  has_and_belongs_to_many :students
  has_and_belongs_to_many :instructors, :class_name => 'Employee', 
    :association_foreign_key => 'instructor_id', 
    :join_table => 'class_gyms_instructors', :uniq => true
    
  validates :instructors, :modality, presence: true
    
  attr_accessible :schedule, :capacity, :modality_id, :instructor_ids, :instructors, 
    :student_ids, :open, :start_date, :instructors_attributes, :schedules_attributes

  
  accepts_nested_attributes_for :students, :allow_destroy => true
  accepts_nested_attributes_for :instructors, :allow_destroy => true
  
  def calendar_days
    today = Date.today
    if !self.start_date.blank?
    end
    return self.start_date.blank? ? 0 : (self.start_date.to_date > today ? 0 : (today - self.start_date.to_date).to_i)
  end
  
end
