class AddAttachmentWorkbookToSpreadsheets < ActiveRecord::Migration
  def self.up
    change_table :spreadsheets do |t|
      t.attachment :workbook
    end
  end

  def self.down
    remove_attachment :spreadsheets, :workbook
  end
end
