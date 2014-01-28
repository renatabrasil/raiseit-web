class Equipment < ActiveRecord::Base
  belongs_to :modality
  
  has_many :workouts, dependent: :destroy
  
  attr_accessible :description, :quantity, :status_equipment_id, :modality_id
end
