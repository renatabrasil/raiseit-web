class CreateLocalities < ActiveRecord::Migration
  def change
    create_table :localities do |t|
      t.string :address, limit: 300
      t.string :district, limit: 100
      t.float :latitude
      t.float :longitude
      t.string :zipcode, limit: 20
      
      # Polomorfismo
      t.references :address, polymorphic: true
      
      # Foreign Key
      t.belongs_to :city
      t.belongs_to :state
      
      # Foreign key
      # t.integer :pessoa_id
      # t.integer :corretor_id, :references => "pessoas"

      t.timestamps
    end
  end
end
