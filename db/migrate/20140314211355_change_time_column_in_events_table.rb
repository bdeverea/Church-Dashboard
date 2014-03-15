class ChangeTimeColumnInEventsTable < ActiveRecord::Migration
  def up
  	change_column(:events, :time, :datetime)
  	remove_column(:events, :date)
  end

  def down
  	change_column(:events, :time, :time)
  	add_column(:events, :date)
  end
end
