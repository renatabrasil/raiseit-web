class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name, limit: 100
      t.string :acronym, limit: 8
      
      # Foreign Key
      t.belongs_to :country

      t.timestamps
    end
  end
end
