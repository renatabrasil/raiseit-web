class Person < ActiveRecord::Base
  
  has_one :locality, as: :address, dependent: :destroy
  
  accepts_nested_attributes_for :locality, :allow_destroy => true
  
  attr_accessible :name, :phone1, :phone2, :locality_attributes
  
end
