class AddPhysicalCategoryIdToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :physical_category_id, :integer
  end
end
