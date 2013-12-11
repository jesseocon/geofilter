class Restaurant < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :locations, as: :locatable
  
  
  def self.search(params)
    if params[:search] && !params[:search].blank?
      ids = self.locations(params).collect { |x| x.locatable_id }
      where(id: ids).order('name ASC')
    else
      Restaurant.order('name ASC').all
    end
  end
  
  def self.locations(params)
    
    # check to make sure that the distance parameter is a number and is greater than 0
    # if params[:distance] is 0 or NaN then set to 10
    distance = params[:distance].to_i == 0 ? 10 : params[:distance] 
    
    Location.near(params[:search], distance).where(locatable_type: 'Restaurant')
  end
  

end
