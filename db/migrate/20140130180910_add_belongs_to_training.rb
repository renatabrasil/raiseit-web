class AddBelongsToTraining < ActiveRecord::Migration
  def change
    add_column :trainings, :model_workout_sheet_id, :integer
  end
end
