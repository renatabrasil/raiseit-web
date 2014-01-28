class Modality < ActiveRecord::Base
  has_many :instructors
  
  has_many :equipments
  
  attr_accessible :name
  
end
