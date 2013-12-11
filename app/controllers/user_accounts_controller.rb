class UserAccountsController < ApplicationController
  def index
    
  end
  
  def new
    @user_signup = UserSignup.new()
  end
  
  def create
    @user_signup = UserSignup.create(params[:user_signup])
    if @user_signup.submit
      redirect_to user_path(@user_signup.user)
    else
      render :new
    end
  end

  def show
    
  end
  
  def destroy
    
  end
  
end