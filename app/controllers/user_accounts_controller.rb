class UserAccountsController < ApplicationController
  before_filter :find_account, only: [:show, :edit, :update, :destroy]
  
  def index
    
  end
  
  def new
    @user_account = UserAccount.new()
  end
  
  def create
    @user_account = UserAccount.new()
    if @user_account.submit(params[:user_account])
      flash[:success] = 'Your account has been created!'
      redirect_to login_path
    else
      flash[:error] = 'Your account could not be created!'
      render :new
    end
  end

  def show
  end
  
  def destroy
    
  end
  
  private 
  
  def find_account
    user = User.find(params[:id])
    # fix to set a primary flag when have more time
    @user_account = UserAccount.new(user: user, location: user.locations.first)
  end
  
end