class CreateTrainingGoals < ActiveRecord::Migration
  def change
    create_table :training_goals do |t|
      t.string :denomination, limit: 500

      t.timestamps
    end
  end
end
