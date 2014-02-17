class ModelWorkoutSheet < ActiveRecord::Base
  DEFAULT = 1
  
  attr_accessible :name, :physical_categories_attributes, :workouts_attributes
  
  has_many :physical_categories, dependent: :destroy
  has_many :trainings
  
  accepts_nested_attributes_for :physical_categories, :allow_destroy => true
  
  validates :name, presence:true
  
  def self.new_copy(id)
    model_workout_sheet = ModelWorkoutSheet.find(id)
    model_workout_sheet_copy = model_workout_sheet.dup # dup = duplicate
    
    model_workout_sheet.physical_categories.each do |physical_category|
      model_workout_sheet_copy.physical_categories << physical_category.dup
       physical_category.workouts.each do |workout|
          model_workout_sheet_copy.physical_categories.last.workouts << workout.dup
       end
    end
    
    model_workout_sheet_copy
  end
  
end
