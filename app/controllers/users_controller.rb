class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      render :new
    end
  end

 
  def user_params
    params.require(:user).permit(:email,:password,:name, :file)
  end
end
