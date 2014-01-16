class Modality < ActiveRecord::Base
  has_many :instructors
  
  attr_accessible :name
  
end
