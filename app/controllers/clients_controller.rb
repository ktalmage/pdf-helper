class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :user_client_check, only: [:show, :edit]
  before_action :authorized
  
  def index
    if params[:search]
      @clients = current_user.clients.search(params[:search]).uniq
    else
       @clients = current_user.clients.uniq
     
    end
  end
  
  def show
  
    if @client
      else
      redirect_to '/welcome'
    end
  end

  def new
    @client = current_user.clients.new
    @client.investments.build
  end

  def create
    @client = current_user.clients.new(client_params)
    
      if @client.save
        redirect_to new_client_investment_path(@client)
      else
        render :new
    end
  end

  def edit
   
    if @client
      else
      redirect_to '/welcome'
    end
  end

  def update
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

 
  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name,:ein, :search)
  end

  def user_client_check
    @client = current_user.clients.find_by(id: params[:id])
  end
end
