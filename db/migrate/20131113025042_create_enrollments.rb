class CreateEnrollments < ActiveRecord::Migration
  def change
    # create_schema 'staff'
    
    # create_table :enrollments, :schema => "staff" do |t|
    create_table :enrollments do |t|
      
      t.string :code, limit: 100
      t.timestamp :start_date
      t.string :note, limit: 500
      t.column :value, :numeric, :precision => 6, :scale => 2
      t.column :registration_fee, :numeric, :precision => 6, :scale => 2
      t.column :discount, :numeric, :precision => 6, :scale => 2
      
      # Foreign Key
      t.belongs_to :modality
      t.belongs_to :periodicity
      t.integer :student_id, :references => "students"

      t.timestamps
    end
  end
end
