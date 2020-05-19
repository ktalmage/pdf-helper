class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :destroy]
  before_action :authorized
  
  def index
  if params[:user_id]
    set_user
    @clients = @user.clients
   else
    @clients = Client.all
   end 
  end
  
  def show
    @client = Client.find(params[:id])
    params.inspect
    if params[:client_id]
      @clients = @client.investments
      
      
    end
  end

  def new
    @client = Client.new
    @client.investments.build
  end

  def create
    @client = current_user.clients.new(client_params)
    if @client.valid? && current_user
      @client.save
    redirect_to @client
    else
      render :new
    end
  end

  def edit
  end

  def update
    set_client
    @client.update(client_params)
      if @client.valid? && current_user
      @client.save
      redirect_to @client
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    flash[:notice] = "Client deleted."
    redirect_to clients_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name,:ein,investments_attributes: [:name,:ein,:ordinary_income,:interest_income,:st_capital,:mt_capital,:lt_capital,:client_id])
  end
end
