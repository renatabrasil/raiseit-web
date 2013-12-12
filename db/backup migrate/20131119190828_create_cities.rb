class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, limit: 100
      t.boolean :capital, :null => false, :default => false

      # Foreign Key
      t.belongs_to :state
      
      t.timestamps
    end
  end
end
