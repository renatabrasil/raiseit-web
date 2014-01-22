# encoding: utf-8
class Periodicity < ActiveRecord::Base
  ANUAL = 1
  MENSAL = 2
  SEMANAL = 3
  SEMESTRAL = 4
    
  attr_accessible :description
end
