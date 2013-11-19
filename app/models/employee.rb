class Employee < Individual
  INSTRUCTOR = 5
  
  scope :employee, -> { where(type: 'Employee') }
  
  belongs_to :type_employee, foreign_key: :type_employee_id
  has_one :user, as: :user_account, dependent: :destroy
  
  attr_accessible :enrollment, :type_employee_id
  
end
