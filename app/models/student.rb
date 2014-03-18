class Student < Individual
  scope :student, -> { where(type: 'Student') }
  
  has_and_belongs_to_many :class_gyms
  has_many :enrollments, dependent: :destroy
  has_many :workout_sheets, dependent: :destroy
  
  # has_one :user, as: :user_account, dependent: :destroy
  
  attr_accessible :user_attributes, :class_gym_ids

  #accepts_nested_attributes_for :user, :allow_destroy => true
  
  def attendance(class_gym_id)
    return EntryRecord.distinct.joins("INNER JOIN class_gyms_people ON class_gyms_people.student_id = entry_records.individual_id
            INNER JOIN class_gyms ON class_gyms_people.class_gym_id = class_gyms.id").where(
            "entry_records.individual_id = ? AND class_gyms.id = ?", self.id, class_gym_id).count
  end
  
  def was_i_present?(date_time, class_gym)
      TODO     
  end
  
  def month_attendance(year, month)
    beginning_month = Time.new(year, month, 1)
    end_month = beginning_month.end_of_month
    
    self.entry_records.select("DATE(entry_time)").distinct
      .where(entry_time: beginning_month..end_month).count
  end
  
  def graph_year_attendance(year)
    students = Array.new
    
    for month in 1..12      
      students.push(
        :x => Date::MONTHNAMES[month], 
        :y => month_attendance(year, month)
      )
    end
 
    students
  end
  
  def month_class_attendance(year, month, class_gym)
    beginning_month = Time.new(year, month, 1)
    end_month = beginning_month.end_of_month
    count = 0
    
    if beginning_month > class_gym.start_date
      self.entry_records.select("DATE(entry_time)").distinct
      .where(entry_time: beginning_month..end_month).each do |entry_records|
        
      end        
    end
    
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
