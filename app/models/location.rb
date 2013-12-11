class Location < ActiveRecord::Base
  attr_accessible :address, :lattitude, :longitude, :locatable_id, :locatable_type
  
  belongs_to :locatable, polymorphic: true
  
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  
end
