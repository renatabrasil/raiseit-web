class Equipment < ActiveRecord::Base
  belongs_to :modality
  
  attr_accessible :description, :quantity, :status_equipment_id, :modality_id
end
