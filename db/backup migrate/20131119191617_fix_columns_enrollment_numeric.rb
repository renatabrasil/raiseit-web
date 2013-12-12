class FixColumnsEnrollmentNumeric < ActiveRecord::Migration
  def change
    execute("ALTER TABLE enrollments ALTER COLUMN value TYPE numeric(6,2);")
    execute("ALTER TABLE enrollments ALTER COLUMN registration_fee TYPE numeric(6,2);")
    execute("ALTER TABLE enrollments ALTER COLUMN discount TYPE numeric(6,2);")
  end
end
