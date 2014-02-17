class Person < ActiveRecord::Base
  
  has_many :entry_records, :class_name => EntryRecord, :foreign_key => :individual_id, dependent: :destroy
  
  has_one :locality, as: :address, dependent: :destroy
  
  accepts_nested_attributes_for :locality, :allow_destroy => true
  
  attr_accessible :name, :phone1, :phone2, :locality_attributes
  
  
  def my_type_is?(type_name)
    self.type == type_name.to_s.capitalize
  end
  
end
