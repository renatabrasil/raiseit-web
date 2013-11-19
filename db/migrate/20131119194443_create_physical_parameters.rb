class CreatePhysicalParameters < ActiveRecord::Migration
  def change
    create_table :physical_parameters do |t|
      t.string :description, limit: 200

      t.timestamps
    end
  end
end
