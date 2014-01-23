class PhysicalCategory < ActiveRecord::Base
  attr_accessible :name
  
  has_many :workouts, dependent: :destroy
  
  validates :name, presence:true
end
