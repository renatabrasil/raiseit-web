class AddModelWorkoutSheetIdToPhysicalCategory < ActiveRecord::Migration
  def change
    add_column :physical_categories, :model_workout_sheet_id, :integer
  end
end
