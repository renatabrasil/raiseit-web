class Student < Individual
  scope :student, -> { where(type: 'Student') }
  
  has_and_belongs_to_many :class_gyms
  has_many :enrollments, dependent: :destroy
  
  # has_one :user, as: :user_account, dependent: :destroy
  
  attr_accessible :user_attributes, :class_gym_ids

  #accepts_nested_attributes_for :user, :allow_destroy => true
  
  def attendance(class_gym_id)
    return EntryRecord.distinct.joins("INNER JOIN class_gyms_people ON class_gyms_people.student_id = entry_records.individual_id
            INNER JOIN class_gyms ON class_gyms_people.class_gym_id = class_gyms.id").where(
            "entry_records.individual_id = ? AND class_gyms.id = ?", self.id, class_gym_id).count
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
