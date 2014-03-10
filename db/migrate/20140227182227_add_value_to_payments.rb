class AddValueToPayments < ActiveRecord::Migration
  def change
    change_table :payments do |t|
      t.rename :payday, :pay_day
      t.column :value, :numeric, :precision => 6, :scale => 2
    end
    
    reversible do |dir|
      dir.up do
        # Fix columns type
        execute <<-SQL
          ALTER TABLE payments 
            ALTER COLUMN value TYPE numeric(6,2)
        SQL
      end
      
      dir.down do
      end
    end
    
    # Fix columns type
    # execute <<-SQL
      # ALTER TABLE payments 
        # ALTER COLUMN value TYPE numeric(6,2)
    # SQL
  end
end
