class CreateClassGyms < ActiveRecord::Migration
  def change
    create_table :class_gyms do |t|
      t.integer :capacity
      t.string :schedule, limit: 200
      
      # Foreign key
      t.belongs_to :modality
      t.integer :instructor_id, :references => "people"

      t.timestamps
    end
  end
end
