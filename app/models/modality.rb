class Modality < ActiveRecord::Base
  WORK_OUT = 1
  
  has_many :instructors
  
  has_many :equipments
  
  attr_accessible :name
  
end
