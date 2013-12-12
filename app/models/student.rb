class Student < Individual
  scope :student, -> { where(type: 'Student') }
  
  has_and_belongs_to_many :class_gyms
  has_many :enrollments
  
  # has_one :user, as: :user_account, dependent: :destroy
  
  attr_accessible :user_attributes, :class_gym_ids

  #accepts_nested_attributes_for :user, :allow_destroy => true
  
end
