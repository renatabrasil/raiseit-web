class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.timestamps :expirationDate
      t.timestamps :payday
      
      t.belongs_to :person

      t.timestamps
    end
  end
end
