# encoding: utf-8
class Individual < Person

  has_many :payments, dependent: :destroy
  has_many :entry_records, dependent: :destroy
  
  scope :individual, -> { where(type: 'Individual') }
  
  attr_accessible :cpf, :rg, :gender, :email, :code
  
  has_one :user, as: :user_account, dependent: :destroy
  
  accepts_nested_attributes_for :user, :allow_destroy => true
  
  def self.collection
    # SELECT "people".* FROM "people" WHERE "people"."type" IN ('Individual', 'Employee', 'Student')
    return Person.find_by_sql "SELECT people.* FROM people WHERE people.type IN ('Individual', 'Employee', 'Student')"
  end

end
