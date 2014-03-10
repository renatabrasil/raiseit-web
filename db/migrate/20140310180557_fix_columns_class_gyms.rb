class FixColumnsClassGyms < ActiveRecord::Migration
  def change
    change_table :class_gyms do |t|
      t.remove :instructor_id
    end
  end
end
