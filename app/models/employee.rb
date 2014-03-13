class Employee < Individual
  
  scope :employee, -> { where(type: 'Employee') }
  
  belongs_to :type_employee, foreign_key: :type_employee_id
  has_and_belongs_to_many :gym_classes, :foreign_key => 'instructor_id', 
    :join_table => 'gym_classes_instructors' 
  
  attr_accessible :type_employee_id, :user_attributes
  
  # To load instructor relates to bodybuilding
  def self.load_bodybuilder_instructors
    return Employee.distinct.joins(:gym_classes).joins("INNER JOIN modalities ON 
      modalities.id = gym_classes.modality_id").where("modalities.id = ? AND 
      people.type_employee_id = ?", Modality::WORK_OUT, TypeEmployee::TEACHER)
  end
  
end
