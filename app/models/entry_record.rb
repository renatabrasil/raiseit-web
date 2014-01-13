class EntryRecord < ActiveRecord::Base
  belongs_to :individual, :class_name => 'Individual', :foreign_key => 'individual_id'
  
  
  attr_accessible :individual_id, :entry_time, :exit_time
  
  def self.students_by_day(day_date)
    return EntryRecord.joins(
      "INNER JOIN people ON people.id = entry_records" \
      ".individual_id AND people.type IN ('Student')")
        .where(:entry_time => day_date.beginning_of_day..day_date.end_of_day)
  end
  
  def self.students_between_days(initial_date, final_date)
    return EntryRecord.joins(
      "INNER JOIN people ON people.id = entry_records" \
      ".individual_id AND people.type IN ('Student')")
        .where(
          :entry_time => initial_date.beginning_of_day..final_date.end_of_day
        )
  end
  
  def self.students_by_hour(hour)
    return EntryRecord.joins("INNER JOIN people ON people.id = entry_records" \
    ".individual_id AND people.type IN ('Student')")
      .where(
        "(entry_records.entry_time BETWEEN  ?  AND  ?) AND " \
        "(entry_records.exit_time BETWEEN ? AND ?)", 
        hour.beginning_of_day, hour.end_of_hour, hour, hour.end_of_day
      )
  end
  
  def self.students_between_days_to_graph(d1, d2)
    today = d1
    students = Array.new
    
    while today <= d2
      students.push(:x => today, :y => self.students_by_day(today).count)
      today = today.tomorrow
    end 
    
    return students
  end
  
  def self.students_between_months_to_graph(year)
    students = Array.new
    
    for month in 1..12
      month_beginning = Date.new(year, month, 1)
      month_end = month_beginning.end_of_month
      
      students.push(
        :x => Date::MONTHNAMES[month], 
        :y => self.students_between_days(month_beginning, month_end).count
      )
    end
 
    return students
  end
  
  def self.students_between_hours_to_graph(day)
    students = Array.new
    
    hour = day.beginning_of_day
    
    for time in 0..23
      students.push(:x => hour.strftime("%F %T"), 
                    :y => self.students_by_hour(hour).count)
      hour = hour + 1.hour
    end
 
    return students
  end
end

