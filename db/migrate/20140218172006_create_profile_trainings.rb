class CreateProfileTrainings < ActiveRecord::Migration
  def change
    create_table :profile_trainings do |t|
      t.string :name, limit: 200
      
      # Foreign key
      t.belongs_to :training_goal
      t.integer :created_by, :references => "people"

      t.timestamps
    end
  end
end
