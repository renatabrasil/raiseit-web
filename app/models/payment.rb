class Payment < ActiveRecord::Base

  belongs_to :person, :class_name => 'Person', 
  :foreign_key => 'individual_id'
  
  belongs_to :account, polymorphic: true

  attr_accessible :payday, :individual_id

end
