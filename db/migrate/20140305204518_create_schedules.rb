class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :week_day
      t.time :start_time
      t.time :end_time
      t.references :class_gym, index: true

      t.timestamps
    end
    
    remove_column :class_gyms, :schedule, :string
  end
end
