class RemoveLattitudeFromLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :lattitude
  end
end
