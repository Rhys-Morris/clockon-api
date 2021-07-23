class UsersController < ApplicationController
  before_action :authorized, only: [:authenticate]

  # REGISTRATION
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  # AUTHENTICATION
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  def authenticate
    render json: @user
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
