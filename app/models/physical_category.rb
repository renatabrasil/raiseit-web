class PhysicalCategory < ActiveRecord::Base
  attr_accessible :name, :workouts_attributes, :model_workout_sheet_id
  
  has_many :workouts, dependent: :destroy
  belongs_to :model_workout_sheet
  
  validates :name, presence:true
  
  accepts_nested_attributes_for :workouts, :allow_destroy => true
end
