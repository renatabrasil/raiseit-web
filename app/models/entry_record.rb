class EntryRecord < ActiveRecord::Base
  belongs_to :individual, :class_name => 'Individual', :foreign_key => 'individual_id'
  
  
  attr_accessible :individual_id, :entry_time, :exit_time
  
  def self.students_by_day(day_date)
     return EntryRecord.joins(:individual).where('people.type' => 'Student', :entry_time => day_date.beginning_of_day..day_date.end_of_day)
  end
  
  def self.students_between_days(initial_date, final_date)
     return EntryRecord.joins(:individual).where('people.type' => 'Student', :entry_time => initial_date.beginning_of_day..final_date.end_of_day)
  end
  
  
  def self.test(d1, d2)
    day = d1
    students = Array.new
    while day <= d2
      students.push(students_by_day(day).size)
      day = day.tomorrow
    end 
    
    return students
  end
  
end
