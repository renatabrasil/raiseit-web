# encoding: utf-8
class Instructor < Employee
  
  scope :instructor, -> { where(type: 'Instructor') }
  
  has_many :class_gyms
  
  
end
