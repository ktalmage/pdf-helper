class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :destroy]
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def show
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    if @client.save
    redirect_to @client
    else
      render :new
    end
  end

  def destroy
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name,:ein)
  end
end
