class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :destroy]
  def index
    @clients = Client.all
  end
  
  def show
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
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

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name,:ein)
  end
end
