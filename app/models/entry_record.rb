class EntryRecord < ActiveRecord::Base
  belongs_to :individual, :class_name => 'Individual', :foreign_key => 'individual_id'
  
   attr_accessible :individual_id, :entryTime, :exitTime
end
