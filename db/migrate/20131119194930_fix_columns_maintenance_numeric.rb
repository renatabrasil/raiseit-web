class FixColumnsMaintenanceNumeric < ActiveRecord::Migration
  def change
    execute("ALTER TABLE maintenances ALTER COLUMN value TYPE numeric(6,2);")
  end
end
