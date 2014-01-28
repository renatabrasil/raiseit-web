class Individual < Person

  has_one :registration_code, dependent: :destroy
  has_many :payments
  has_many :entry_records, dependent: :destroy
  
  scope :individual, -> { where(type: 'Individual') }
  
  attr_accessible :cpf, :rg, :gender, :email, :registration_code_id, :registration_code_attributes
  
  has_one :user, as: :user_account, dependent: :destroy
  
  accepts_nested_attributes_for :user, :allow_destroy => true
  accepts_nested_attributes_for :registration_code, :allow_destroy => true

end
