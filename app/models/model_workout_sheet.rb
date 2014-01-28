class ModelWorkoutSheet < ActiveRecord::Base
  attr_accessible :name, :physical_categories_attributes, :workouts_attributes
  
  has_many :physical_categories, dependent: :destroy
  
  accepts_nested_attributes_for :physical_categories, :allow_destroy => true
end
