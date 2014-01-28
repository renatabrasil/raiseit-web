class CreateClassGyms < ActiveRecord::Migration
  def change
    create_table :class_gyms do |t|
      t.integer :capacity
      t.string :code, limit: 8
      t.datetime :start_date
      t.string :schedule, limit: 200
      t.boolean :open, :null => false, :default => true
      t.boolean :active, :null => false, :default => true
      
      # Foreign key
      t.belongs_to :modality
      t.integer :instructor_id, :references => "people"

      t.timestamps
    end
  end
end
