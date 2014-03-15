class CreateCampuses < ActiveRecord::Migration
  def change
    create_table :campuses do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.integer :phone, limit: 8

      t.timestamps
    end
  end
end
