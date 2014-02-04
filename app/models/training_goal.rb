class TrainingGoal < ActiveRecord::Base
  has_many :trainings
    
  attr_accessible :denomination
end
