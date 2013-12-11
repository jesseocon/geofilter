class RemoveRestaurantIdFromLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :restaurant_id
  end
end
