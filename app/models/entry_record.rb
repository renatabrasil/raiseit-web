class EntryRecord < ActiveRecord::Base
  belongs_to :individual, :class_name => 'Individual', :foreign_key => 'individual_id'
end
