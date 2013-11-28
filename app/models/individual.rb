class Individual < Person
  STUDENT = 3
  EMPLOYEE = 4
  
  has_many :payments
  has_many :entry_records, dependent: :destroy
  
  #default_scope :conditions => {:type => PHYSICAL}
  scope :individual, -> { where(type: 'Individual') }
  #default_scope  {where(:type => PHYSICAL)}
  
  attr_accessible :cpf, :rg, :gender, :email
  
  has_one :user, as: :user_account, dependent: :destroy
  
  accepts_nested_attributes_for :user, :allow_destroy => true

end
