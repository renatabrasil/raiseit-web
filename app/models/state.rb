# encoding: utf-8
class State < ActiveRecord::Base
  belongs_to :country, :foreign_key => 'country_id'
  has_many :cities
  
  attr_accessible :name, :acronym, :country_id
end
