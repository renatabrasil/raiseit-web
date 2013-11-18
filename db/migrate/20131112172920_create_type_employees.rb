class CreateTypeEmployees < ActiveRecord::Migration
  def change
    create_table :type_employees do |t|
      t.string :name, limit: 60

      t.timestamps
    end
  end
end
