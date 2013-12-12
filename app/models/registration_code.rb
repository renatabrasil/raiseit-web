class RegistrationCode < ActiveRecord::Base
  has_many :enrollment
  belongs_to :individual, :class_name => 'Individual', :foreign_key => 'individual_id'
  
  attr_accessible :code, :individual_id
end
