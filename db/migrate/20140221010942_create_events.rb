class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :service_id
      t.integer :campus_id
      t.datetime :date_time

      t.timestamps
    end
  end
end
