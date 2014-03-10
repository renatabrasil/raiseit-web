class FixColumnsTrainingBelongsToProfileTraining < ActiveRecord::Migration
  def change
    change_table :trainings do |t|
      # Foreign key
      t.belongs_to :profile_training
      
    end
    change_column :trainings, :training_type, :string, :limit => 1, :null => true
  end
end
