# encoding: utf-8
class Locality < ActiveRecord::Base

  belongs_to :address, polymorphic: true
  belongs_to :city, foreign_key: :city_id
  belongs_to :state, foreign_key: :state_id
  
  accepts_nested_attributes_for :city
  accepts_nested_attributes_for :state
  
  #validates :endereco, :presence => { :message => "Endereço não pode ficar em branco." }
  #validates :bairro, :presence => { :message => "Bairro não pode ficar em branco." }
  #validates :cidade_id, :presence => { :message => "Cidade não pode ficar em branco." }
  #validates :estado_id, :presence => { :message => "Estado não pode ficar em branco." }

  attr_accessible :address, :district, :cep, :latitude, :longitude, :city_id, :state_id, :person_id, :city_attributes, :state_attributes
end
