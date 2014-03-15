class ChangeTimeColumnInEventsTable < ActiveRecord::Migration
  def up
  	remove_column :events, :time
  	add_column :events, :time, :datetime

  	remove_column :events, :date
  end

  def down
  	change_column :events, :time, :time
  	add_column :events, :date, :date
  end
end
