class CreateEntryRecords < ActiveRecord::Migration
  def change
    create_table :entry_records do |t|
      t.datetime :entryTime
      t.datetime :exitTime
     
      t.integer :individual_id, :references => "people"

      t.timestamps
    end
  end
end
