class CreateRegistrationCodes < ActiveRecord::Migration
  def change
    create_table :registration_codes do |t|
      t.string :code, limit: 100

      # Foreign Key
      t.integer :individual_id, :references => "people"
      
      t.timestamps
    end
  end
end
