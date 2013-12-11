class RestaurantSignup < Signup
  
  attr_accessor :restaurant, :location
  delegate :name, to: :restaurant
  
   
  def initialize(attributes ={})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
    
    @restaurant ||= Restaurant.new()
    @location   ||= Location.new(locatable_type: 'Restaurant')
  end
  
  def submit
    if self.valid?
      @restaurant.save!
      @location.locatable_id = @restaurant.id
      @location.save!
      return true
    else
      return false
    end
  end
  
end