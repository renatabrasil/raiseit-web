class CreateModalities < ActiveRecord::Migration
  def change
    create_table :modalities do |t|
      t.string :name, limit: 200

      t.timestamps
    end
  end
end
