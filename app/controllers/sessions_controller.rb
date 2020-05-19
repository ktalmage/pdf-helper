class SessionsController < ApplicationController
skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
    @user = User.new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      @user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
    @user = User.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to '/welcome'
      else
        redirect_to '/login' 
      end
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
    redirect_to '/welcome'
  end
  
  private

  def page_requires_login
   redirect_to '/welcome' unless logged_in?
  end

  def find_by
    @user = User.find_by(email: params[:email])
  end
end

