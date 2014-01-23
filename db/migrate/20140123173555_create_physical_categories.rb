class CreatePhysicalCategories < ActiveRecord::Migration
  def change
    create_table :physical_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
