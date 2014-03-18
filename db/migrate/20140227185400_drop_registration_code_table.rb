class DropRegistrationCodeTable < ActiveRecord::Migration
#  def change
#    
#    reversible do |dir|
#      dir.up do
#        drop_table :registration_codes
#      end
#      
#      dir.down do
#        create_table :registration_codes do |t|
#          t.string :code, limit: 100
#    
#          # Foreign Key
#          t.integer :individual_id, :references => "people"
#          
#          t.timestamps
#        end
#      end
#    end
#    
#  end
end
