class RestaurantAccountsController < ApplicationController
  def index
    
  end
  
  def new
    @restaurant_account = RestaurantAccount.new()
  end
  
  def create
    @restaurant_account = RestaurantAccount.new()
    if @restaurant_account.submit(params[:restaurant_account])
      redirect_to restaurant_account_path(@restaurant_account.restaurant)
    else
      render :new
    end
  end

  def show
    
  end
  
  def destroy
    
  end
  
end