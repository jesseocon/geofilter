class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.search(search: params[:search], distance: params[:distance])
  end
  
  
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  
end