class ClientsController < ApplicationController
  def show
    @client = Client.find(params[:id])
  end

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    @client.save
    redirect_to @client
  end

  def destroy
  end

  private

  def client_params
    params.require(:client).permit(:name,:ein)
end
end
