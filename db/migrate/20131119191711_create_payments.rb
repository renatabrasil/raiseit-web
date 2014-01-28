class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.datetime :payday
      
      # Polomorfismo
      t.references :account, polymorphic: true
      
      # Foreign key
      t.integer :individual_id, :references => "people"

      t.timestamps
    end
  end
end
