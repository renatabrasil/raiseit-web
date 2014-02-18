class FixColumnsTrainingBelongsToProfileTraining < ActiveRecord::Migration
  def change
    change_table :trainings do |t|
      # Foreign key
      t.belongs_to :profile_training
      
    end
  end
end
