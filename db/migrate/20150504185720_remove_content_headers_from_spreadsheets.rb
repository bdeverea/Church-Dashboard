class RemoveContentHeadersFromSpreadsheets < ActiveRecord::Migration
  def change
    remove_column :spreadsheets, :headers
    remove_column :spreadsheets, :content
    remove_column :spreadsheets, :file_path
  end
end
