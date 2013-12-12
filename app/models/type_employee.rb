# encoding: utf-8
class TypeEmployee < ActiveRecord::Base
  TEACHER = 3
  INSTRUCTOR = 4
  
  has_many :employees
  
  attr_accessible :name
  
end
