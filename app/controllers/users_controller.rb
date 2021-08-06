class UsersController < ApplicationController
  before_action :authorized, only: [:user_details, :dash]

  # REGISTRATION
  def create
    @user = User.new(user_params)
    if @user.save
      token = encode_token({user_id: @user.id})
      render json: {token: token}
    else
      render json: {error: @user.errors.full_messages}
    end
  end

  def user_details
    render json: { user: {name: @user.name, email: @user.email} }, status: 200
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

  def dash
    if !params[:period]
      render json: { 
        user: { name: @user.name, email: @user.email },
        tasks: @user.tasks.priority,
        work_periods: @user.work_periods.last_week,
      }, 
      status: 200
    elsif params[:period] == "week"
      render json: { work_periods: @user.work_periods.last_week }, status: 200
    elsif params[:period] == "month"
      render json: { work_periods: @user.work_periods.last_month }, status: 200
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
