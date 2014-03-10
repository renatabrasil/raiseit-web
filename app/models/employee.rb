class Employee < Individual
  
  scope :employee, -> { where(type: 'Employee') }
  
  belongs_to :type_employee, foreign_key: :type_employee_id
  has_and_belongs_to_many :class_gyms, :foreign_key => 'instructor_id', 
    :join_table => 'class_gyms_instructors' 
  
  attr_accessible :type_employee_id, :user_attributes
  
  # To load instructor relates to bodybuilding
  def self.load_bodybuilder_instructors
    return Employee.distinct.joins(:class_gyms).joins("INNER JOIN modalities ON 
      modalities.id = class_gyms.modality_id").where("modalities.id = ? AND 
      people.type_employee_id = ?", Modality::WORK_OUT, TypeEmployee::TEACHER)
  end
  
end
