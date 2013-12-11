class Account
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  

  delegate :address, :longitude, :latitude, :locatable_id, :locatable_type, to: :location
  
  
end