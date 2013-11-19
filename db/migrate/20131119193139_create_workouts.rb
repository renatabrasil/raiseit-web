class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :description, limit: 500
      
      # Foreign key
      t.belongs_to :equipment
      
      t.timestamps
    end
  end
end
