class CreateEntryRecords < ActiveRecord::Migration
  def change
    create_table :entry_records do |t|
      t.timestamps :entryTime
      t.timestamps :exitTime
      
      t.belongs_to :person

      t.timestamps
    end
  end
end
