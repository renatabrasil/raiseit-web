class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.timestamp :last_training_date
      t.timestamp :expiration_date
      t.boolean :active
      
      # Foreign key
      t.belongs_to :training_goal
      t.integer :student_id, :references => "people"
      t.integer :instructor_id, :references => "people"
      
      t.timestamps
    end
  end
end
