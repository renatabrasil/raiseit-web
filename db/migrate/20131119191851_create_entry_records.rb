class CreateEntryRecords < ActiveRecord::Migration
  def change
    create_table :entry_records do |t|
      t.datetime :entry_time
      t.datetime :exit_time
     
      t.integer :individual_id, :references => "people"

      t.timestamps
    end
  end
end
