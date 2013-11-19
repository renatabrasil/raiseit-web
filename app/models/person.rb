class Person < ActiveRecord::Base
  # type of person
  PHYSICAL = 1
  LEGAL = 2
  
  has_one :locality, as: :address, dependent: :destroy
  
  accepts_nested_attributes_for :locality, :allow_destroy => true
  
  attr_accessible :name, :phone1, :phone2, :enrollment, :locality_attributes
  
end
