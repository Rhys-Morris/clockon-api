class ClientsController < ApplicationController
  before_action :set_client, only: %i[ destroy edit update show ]

  def index
    render json: { clients: fetch_all_clients }, status: 200
  end

  def create
    @client = @user.clients.create(client_params)
    if @client.valid?
      render json: { clients: fetch_all_clients }, status: 201
    else
      render json: { error: @client.errors.full_messages }
    end
  end

  def show
    render json: { client: @client }
  end

  def update
    if @client.update(client_params)
      render json: { clients: fetch_all_clients }, status: 200
    else
      error = @client.errors.full_messages
      set_client
      render json: { error: error, client: @client }
    end
  end

  def destroy
    @client.destroy
    render json: { clients: fetch_all_clients }, status: 200
  end

  private

  def client_params
    params.require(:client).permit(:name, :email, :contact, :active, :id)
  end
  
  def set_client
    @client = @user.clients.find(params[:id]) 
  end

  def fetch_all_clients
    @clients = @user.clients.with_project_numbers
  end

end
