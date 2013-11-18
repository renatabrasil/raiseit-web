# encoding: utf-8
class City < ActiveRecord::Base
  belongs_to :state, :foreign_key => 'state_id'
    
  attr_accessible :state_id, :name, :capital
end
