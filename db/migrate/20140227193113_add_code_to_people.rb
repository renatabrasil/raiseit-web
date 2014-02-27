class AddCodeToPeople < ActiveRecord::Migration
  class Person < ActiveRecord::Base
  end
  
  def change
    change_table :people do |t|
      t.string :code, limit: 20
      # t.string :code, limit: 20, :after => :type
      
      Person.reset_column_information
      Person.all.each do |p|
        p.update_attribute(:code, '')
      end
    end
    change_column :people, :code, :string, :null => false
  end
end
