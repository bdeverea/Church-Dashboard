class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :description
      t.integer :capacity
      t.integer :campus_id

      t.timestamps
    end
  end
end
