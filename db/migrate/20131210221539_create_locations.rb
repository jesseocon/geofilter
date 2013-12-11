class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.float :lattitude
      t.float :longitude
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
