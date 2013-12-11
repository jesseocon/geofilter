class UserAccount < Account
  
  attr_accessor :user, :location
  delegate :first_name, :last_name, to: :user
  
  def initialize(attributes ={})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
    
    @user     ||= User.new
    @location ||= Location.new(locatable_type: 'User')
  end
  
  
  def submit(params)
    @user.attributes = params.slice(:first_name, :last_name)
    @location.attributes = params.slice(:address)
    if self.valid?
      @user.save!
      @location.locatable_id = @user.id
      @location.save!
      return true
    else
      return false
    end
  end
  
end

