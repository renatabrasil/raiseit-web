class TrainingGoal < ActiveRecord::Base
  has_many :trainings
  
  validates :denomination, presence: true, uniqueness: true
    
  attr_accessible :denomination
end
