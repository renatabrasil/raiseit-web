class Equipment < ActiveRecord::Base
  belongs_to :modality
  
  has_many :workouts, dependent: :destroy
  
  validates :description, presence: true, uniqueness: true
  validates :modality, presence: true
  
  
  attr_accessible :description, :status_equipment_id, :modality_id
end
