class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
  
  ADMIN = 1
  MANAGER = 2
  INSTRUCTOR = 3
  STUDENT = 4
  
end
