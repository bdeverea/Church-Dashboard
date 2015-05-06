class CreateSpreadsheets < ActiveRecord::Migration
  def change
    create_table :spreadsheets do |t|
      t.string :name
      t.text :description
      t.string :created_by
      t.string :modified_by
      t.string :headers
      t.text :content

      t.timestamps
    end
  end
end
