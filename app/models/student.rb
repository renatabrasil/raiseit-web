class Student < Individual
  scope :student, -> { where(type: 'Student') }
  
  has_and_belongs_to_many :gym_classes, :foreign_key => 'student_id', 
    :join_table => 'gym_classes_students' 
  has_many :enrollments, dependent: :destroy
  
  # has_one :user, as: :user_account, dependent: :destroy
  
  attr_accessible :user_attributes, :gym_class_ids

  #accepts_nested_attributes_for :user, :allow_destroy => true
  
  def attendance(gym_class_id)
    return EntryRecord.distinct.joins("INNER JOIN gym_classes_students ON gym_classes_students.student_id = entry_records.individual_id
            INNER JOIN gym_classes ON gym_classes_students.gym_class_id = gym_classes.id").where(
            "entry_records.individual_id = ? AND gym_classes.id = ?", self.id, gym_class_id).count
  end
  
  def enrollment_in_bodybuilding?
    self.enrollments.each do |enrollment|
      if enrollment.modality.id == Modality::WORK_OUT
        return true
      end
    end
    return false
  end
  
end
