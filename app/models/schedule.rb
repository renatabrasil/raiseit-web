class Schedule < ActiveRecord::Base
  belongs_to :class_gym
  
  validates :week_day, :start_time, :end_time, presence: true
  
  attr_accessible :week_day, :start_time, :end_time
end
