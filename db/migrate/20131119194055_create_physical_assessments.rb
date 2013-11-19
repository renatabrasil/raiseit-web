class CreatePhysicalAssessments < ActiveRecord::Migration
  def change
    create_table :physical_assessments do |t|
      t.timestamp :date
      t.string :measurer_feedback
      
      # Foreign key
      t.integer :student_id, :references => "people"
      t.integer :instructor_id, :references => "people"
      t.belongs_to :physical_assessment_type

      t.timestamps
    end
  end
end
