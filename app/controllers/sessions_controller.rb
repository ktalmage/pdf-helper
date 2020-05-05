class SessionsController < ApplicationController
skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
   if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
     redirect_to '/welcome'
   else
      redirect_to '/login'
   end
  end

  def login
  end

  def welcome
  end

  def destroy
   if !session[:user_id].nil?
      session.delete :user_id
    end
    redirect_to '/'
  end
  

  def page_requires_login
   redirect_to '/welcome' unless logged_in?
  end
end
