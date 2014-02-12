class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
  
  ADMINISTRATOR = 1
  SECRETARY = 2
  PROFESSOR = 3
  STUDENT = 4
  
end
