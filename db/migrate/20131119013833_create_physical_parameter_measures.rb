class CreatePhysicalParameterMeasures < ActiveRecord::Migration
  def change
    create_table :physical_parameter_measures do |t|
      t.float :value
      
      # Foreign key
      t.belongs_to :physical_parameter
      t.belongs_to :measure_unit

      t.timestamps
    end
  end
end
