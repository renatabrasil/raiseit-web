class EntryRecord < ActiveRecord::Base
  belongs_to :individual, :class_name => Person
  
  attr_accessible :individual_id, :entry_time, :exit_time
  
  validates :individual_id, :presence => { :message => "Matricula ou senha incorreta" }
  
  def self.new_by_code_and_password(code, password)
    entry_record = EntryRecord.new
    password_valid = false
    person = Person.find_by code: code
    
    puts person.name
    
    if !person.nil?
      # person = Person.find(person.individual_id)
      password_valid = person.user.valid_password?(password)      
    end
    
    if !person.nil? && password_valid
      if person.entry_records.empty?
        entry_record.individual = person
        entry_record.entry_time = Time.zone.now
      elsif person.entry_records.last.exit_time.blank?
        entry_record_temp = person.entry_records.last
        # Safety, just make an exit_time if it's in the same day of entry_time
        if entry_record_temp.entry_time.to_date != Date.today
          entry_record.individual = person
          entry_record.entry_time = Time.zone.now  
        else
          entry_record = entry_record_temp
          entry_record.exit_time = Time.zone.now
        end
      else
        entry_record.individual = person
        entry_record.entry_time = Time.zone.now
      end    
    end
    
    entry_record
  end

  def in_or_out?
    if self.exit_time.blank?
      "Entrada efetuada com sucesso."
    else
      "Saida efetuada com sucesso."
    end
  end
  
  def self.how_many_students?(time)
    self.where(entry_time: time.beginning_of_day..time, exit_time: nil).count
  end
  
  def self.how_many_female_students?(time)
    self.where(entry_time: time.beginning_of_day..time, exit_time: nil)
      .joins(:individual).where('people.gender' => 'F').count
  end
  
  def self.how_many_male_students?(time)
    self.where(entry_time: time.beginning_of_day..time, exit_time: nil)
      .joins(:individual).where('people.gender' => 'M').count
  end
  
  def self.percentual_female_students(time)
    total = self.where(entry_time: time.beginning_of_day..time, exit_time: nil)
      .count.to_f
    
    (how_many_female_students?(time) / (total.nonzero? || 1.0) ) * 100.0
  end
  
  def self.percentual_male_students(time)
     total = self.where(entry_time: time.beginning_of_day..time, exit_time: nil)
      .count.to_f
    
    (how_many_male_students?(time) / (total.nonzero? || 1.0) ) * 100.0    
  end
end
