# encoding: utf-8
class Country < ActiveRecord::Base
  has_many :states
  
  attr_accessible :name, :acronym
end
