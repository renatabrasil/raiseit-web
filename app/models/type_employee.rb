# encoding: utf-8
class TypeEmployee < ActiveRecord::Base
  has_many :employees
  
  attr_accessible :name
  
end
