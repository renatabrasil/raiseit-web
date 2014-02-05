class EntryRecord < ActiveRecord::Base
  belongs_to :individual, :class_name => Person
  
  attr_accessible :individual_id, :entry_time, :exit_time
  
  validates :individual_id, :presence => { :message => "Matricula ou senha incorreta" }
  
  def self.new_by_code_and_password(code, password)
    entry_record = EntryRecord.new
    password_valid = false
    person = RegistrationCode.find_by code: code

    if !person.nil?
      person = Person.find(person.individual_id)
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
  
end
