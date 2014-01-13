namespace :test do
  # bundle exec rake test:load_students RAILS_ENV="development"
  desc "TODO"
  task :load_students, [:delete_before?, :how_many] => :environment do |t, args|
    args.with_defaults(:delete_before? => true, :how_many => 10)
    
    if args[:delete_before?] == "true"
      EntryRecord.joins(
        "INNER JOIN people ON people.id = entry_records" \
        ".individual_id AND people.type IN ('Student')"
      ).delete_all
      
      Student.delete_all
      
      for i in 0..(args[:how_many].to_i - 1)
        Student.create(:name => ("Student_" + i.to_s), 
                       :enrollment => ("777" + i.to_s))
      end
    else
      rand_id = (rand * (500 - 100) + 100).ceil
      
      for i in rand_id..(rand_id + args[:how_many].to_i - 1)
        Student.create(:name => ("Student_" + i.to_s), 
                       :enrollment => (rand_id.to_s + i.to_s))
      end
    end
   
    
  end

  desc "TODO"
  task load_entry_records: :environment do
    YEAR = 2013
    MONTH = 12
    DAY = 3
    
    #EntryRecord.delete_all
    students = Student.all
    rand_positions = (0..(students.size - 1)).to_a.shuffle 
     
    rand_positions.each do |rand_position|
      rand_hour = (rand * (18 - 8) + 8).ceil
      rand_min = (rand * (50 - 1) + 1).ceil
      
      t1 = Time.new(YEAR, MONTH, DAY, rand_hour, rand_min)
      t2 = t1 + 2.hour
      
      rand_student =  students[rand_positions.at(rand_position)]
      
      EntryRecord.create(:entry_time => t1, 
                         :exit_time => t2, 
                         :individual_id => rand_student.id)
    end 
  end
  
  task :my_task, [:arg1, :arg2] => :environment do |t, args|
    args.with_defaults(:arg1 => :default_1, :arg2 => :default_2)
    puts "Args were: #{args} #{Student.first.name}"
  end

end
