class CreatePhysicalAssessmentTypes < ActiveRecord::Migration
  def change
    create_table :physical_assessment_types do |t|
      t.string :description, limit: 200

      t.timestamps
    end
  end
end
