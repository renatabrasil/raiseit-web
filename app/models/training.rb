# encoding: utf-8
class Training < ActiveRecord::Base
  has_many :training_workouts, dependent: :destroy
  has_many :workouts, through: :training_workouts
  
  belongs_to :workout_sheet
  belongs_to :profile_training
  
  accepts_nested_attributes_for :training_workouts, :allow_destroy => true
  accepts_nested_attributes_for :workouts, :allow_destroy => true
  
  # Fix in the user case create profile training
  # validates :training_type, presence: true, if: :profile_training_register?
  
  # Fix with steps
  # validate :uniqueness_training_type, on: :create
  
  attr_accessible :training_type, :last_training_date, :training_workouts_attributes,
    :workouts_attributes, :workout_ids
    
  # Conditional Validation
  def profile_training_register?
    return self.profile_training.nil?
  end
  
  def uniqueness_training_type
    if self.id.nil?
      if !Training.where(workout_sheet_id: self.workout_sheet_id, training_type: self.training_type).exists?.nil?
        errors.add(:training_type, "já existe um treino com este tipo: "+self.training_type+".")
      end
    end
  end
  
  # Return next value of training type
  def next_training_type
    @training_type = Training.joins(:workout_sheet).where(workout_sheet_id: self.workout_sheet.id).
    order(training_type: :desc).limit(1).pluck(:training_type)[0]
    
    if @training_type.nil?
      self.training_type = 'A'
    else
      case @training_type.to_s
      when 'A'
        self.training_type = 'B'
      when 'B'
        self.training_type = 'C'
      when 'C'
        self.training_type = 'D'
      when 'D'
        self.training_type = 'E'
      else
        self.training_type = ''
      end
    end
  end
  
  #
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
  
  # Make a copy from a given training
  def self.new_copy(id)
    training = Training.find(id)
    training_copy = training.dup # dup = duplicate
    training_copy.workout_sheet = nil
    training_copy.training_type = ''
    
    training.training_workouts.each do |training_workout|
      training_workout_copy = training_workout.dup
      training_workout_copy.workout = training_workout.workout
      training_copy.training_workouts << training_workout_copy
      # training_copy.workouts << training_workout.workout.dup
      puts '\n \n Workout para cada Training_workout duplicado: \n'+training_workout_copy.workout.description+" \n \n"
    end
    
    training_copy
  end
  
end
