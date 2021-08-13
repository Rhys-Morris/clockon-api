class UsersController < ApplicationController
  before_action :authorized, only: [:user_details, :dash, :destroy]

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
      render json: {error: "Invalid email or password"}, status: 200
    end
  end

  def dash
    if !params[:period]
      render json: { 
        user: { name: @user.name, email: @user.email },
        tasks: @user.tasks.priority,
        work_periods: @user.work_periods.last_week,
        active_clients: @user.clients.where(active: true).count,
        active_projects: @user.projects.where(active: true).count,
        next_project: @user.projects.order(:due_date)[0]
      }, 
      status: 200
    elsif params[:period] == "week"
      render json: { work_periods: @user.work_periods.last_week }, status: 200
    elsif params[:period] == "month"
      render json: { work_periods: @user.work_periods.last_month }, status: 200
    end
  end

  # DESTROY

  def destroy
    @user.destroy
    render head: :no_content
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
