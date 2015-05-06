class AddFilePathToSpreadsheets < ActiveRecord::Migration
  def self.up
    change_table :spreadsheets do |t|
      t.string :file_path
    end
  end

  def self.down
    remove_column :spreadsheets, :file_path
  end
end
