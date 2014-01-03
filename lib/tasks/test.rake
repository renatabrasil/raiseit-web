namespace :test do
  # bundle exec rake test:load_students RAILS_ENV="development"
  desc "TODO"
  task load_students: :environment do
    EntryRecord.joins("INNER JOIN people ON people.id = entry_records.individual_id AND people.type IN ('Student')").delete_all
    Student.delete_all
    for i in 0..9
      Student.create(:name => ("Student_" + i.to_s), :enrollment => ("777" + i.to_s))
    end
  end

  desc "TODO"
  task load_entry_records: :environment do
    EntryRecord.delete_all
    student = Student.all
    s_array = (0..(student.size - 1)).to_a.shuffle 
     
    for i in 0..9
      h_rand = (rand * (18 - 8) + 8).ceil
      m_rand = (rand * (50 - 1) + 1).ceil
      
      t1 = Time.new(2013, 11, 1, h_rand, m_rand)
      t2 = t1 + 2.hour
      
      s =  student[s_array.at(i)]
      
      EntryRecord.create(:entry_time => t1, :exit_time => t2, :individual_id => s.id)
    end    
  end

end
