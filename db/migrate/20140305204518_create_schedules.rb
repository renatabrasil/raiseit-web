class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :week_day
      t.time :start_time
      t.time :end_time
      t.references :gym_class, index: true

      t.timestamps
    end
    
    remove_column :gym_classes, :schedule, :string
  end
end
