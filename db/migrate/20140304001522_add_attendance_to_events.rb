class AddAttendanceToEvents < ActiveRecord::Migration
  def change
    add_column :events, :attendance, :integer
  end
end
