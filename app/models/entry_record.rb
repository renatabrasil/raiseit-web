class EntryRecord < ActiveRecord::Base
  belongs_to :individual, :class_name => 'Individual', :foreign_key => 'individual_id'
  
  
  attr_accessible :individual_id, :entry_time, :exit_time
  
  def self.students_by_day(day_date)
     return EntryRecord.joins(:individual).where('people.type' => 'Student', :entry_time => day_date.beginning_of_day..day_date.end_of_day)
  end
  
  def self.students_between_days(initial_date, final_date)
     #return EntryRecord.joins(:individual).where('people.type' => 'Student', :entry_time => initial_date.beginning_of_day..final_date.end_of_day)
      return EntryRecord.joins("INNER JOIN people ON people.id = entry_records.individual_id AND people.type IN ('Student')").where(:entry_time => initial_date.beginning_of_day..final_date.end_of_day)
  end
  
  def self.test(d1, d2)
    entry_records = students_between_days(d1, d2)
    today = d1
    students = Array.new
    
    while today <= d2
      students.push(:x => today, :y => entry_records.where(:entry_time => today.beginning_of_day..today.end_of_day).count)
      today = today.tomorrow
    end 
    
    return students
  end
  
end

#EntryRecord.joins("INNER JOIN people ON people.id = entry_records.individual_id AND people.type IN ('Student')").where(:entry_time => t1.beginning_of_day..t2.end_of_day)

