# encoding: utf-8
class Training < ActiveRecord::Base
  has_many :training_workouts, dependent: :destroy
  has_many :workouts, through: :training_workouts
  accepts_nested_attributes_for :training_workouts, :allow_destroy => true
  accepts_nested_attributes_for :workouts, :allow_destroy => true
  
  belongs_to :student, :class_name => 'Student', :foreign_key => 'student_id'
  belongs_to :instructor, :class_name => 'Instructor', :foreign_key => 'instructor_id'
  belongs_to :training_goal
  belongs_to :model_workout_sheet
  
  attr_accessible :active, :last_training_date, :expiration_date, :training_goal_id,
  :instructor_id, :student_id, :training_workouts_attributes
  
  def get_training_workout_by_workout_id(workout_id)
    return self.training_workouts.where(workout_id: workout_id).first
  end
  
  # Return all the physical categories associated to this training
  def physical_categories
      return PhysicalCategory.find_by_sql ["SELECT * FROM physical_categories 
      WHERE physical_categories.id IN ( SELECT DISTINCT a.physical_category_id 
        FROM ( SELECT workouts.* FROM trainings INNER JOIN training_workouts 
        ON training_workouts.training_id = trainings.id 
        INNER JOIN workouts ON workouts.id = training_workouts.workout_id
        WHERE trainings.id = ?) AS a)", self.id]
  end
  
  # Return a hashmap where the key is a physical category and its value is
  # an arraylist regards to workouts
  def group_by_physical
    hash_workouts = Hash.new
    all_workouts = self.workouts
    aux_all_workouts = []
    
    if !all_workouts.empty?
      physical_category_id = 0
      all_workouts.each_with_index do |workout, i|
        
        # Regards to the first value
        if physical_category_id != 0
          # If the id was changed, insert its value and the list in a hashmap
          # and make the aux array empty again
          if physical_category_id != workout.physical_category_id
            physical_category = PhysicalCategory.find(physical_category_id)
            hash_workouts[physical_category] = aux_all_workouts
            aux_all_workouts = []
          end  
        end
        
        aux_all_workouts << workout
        
        # refresh the physical category id
        physical_category_id = workout.physical_category_id
      end
      # Adds the last value in the hashmap
      physical_category = PhysicalCategory.find(physical_category_id)
      hash_workouts[physical_category] = aux_all_workouts
    end
    return hash_workouts
  end
  
end
