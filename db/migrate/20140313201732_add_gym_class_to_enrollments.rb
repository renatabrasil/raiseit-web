class AddGymClassToEnrollments < ActiveRecord::Migration
  def change
    change_table :enrollments do |t|
      t.remove :modality_id
      
      # Foreign Key
      t.belongs_to :gym_class
    end
  end
end
