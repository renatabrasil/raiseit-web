class CreateMonths < ActiveRecord::Migration
  def change
    create_table :months do |t|
      t.string :name, limit: 200
      t.string :abbreviation, limit: 10

      t.timestamps
    end
  end
end
