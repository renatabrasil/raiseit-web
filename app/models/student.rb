class Student < Individual
  #default_scope :conditions => {:type => STUDENT}
  #default_scope {where(:type => STUDENT)}
  scope :student, -> { where(type: 'Student') }
  
  # has_one :user, as: :user_account, dependent: :destroy
  
  attr_accessible :enrollment, :user_attributes

  #accepts_nested_attributes_for :user, :allow_destroy => true
  
end
