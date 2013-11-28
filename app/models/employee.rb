class Employee < Individual
  INSTRUCTOR = 5
  
  scope :employee, -> { where(type: 'Employee') }
  
  belongs_to :type_employee, foreign_key: :type_employee_id
  
  attr_accessible :enrollment, :type_employee_id, :user_attributes
  
end
