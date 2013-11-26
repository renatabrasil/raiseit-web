class CreateSelfPhysicalAssessments < ActiveRecord::Migration
  def change
    create_table :self_physical_assessments do |t|
      t.datetime :assessment_date
      t.string :note
      
      # Foreign key
      t.integer :student_id, :references => "people"

      t.timestamps
    end
  end
end