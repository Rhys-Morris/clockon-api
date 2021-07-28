class WorkPeriodsController < ApplicationController
  before_action :set_work_period, only: [:update, :destroy]
  before_action :set_project, only: [:create, :update, :destroy]
  before_action :fetch_all_work_periods, only: [:index]
  
  def index
    render json: { work_periods: @work_periods }
  end

  def create
      @work_period = @project.work_periods.create(work_period_params)
      if @work_period.valid?
          render json: { work_periods: fetch_all_work_periods }, status: 201
      else
          render json: { error: @work_period.errors.full_messages }
      end    
  end

  def update
      if @work_period.update(work_period_params)
          render json: { work_periods: fetch_all_work_periods }, status: 200
      else
          render json: { error: @task.errors.full_messages }
      end   
  end

  def destroy
      @work_period.destroy
      render json: { work_periods: fetch_all_work_periods }, status: 200
  end

  private

  def set_work_period
      @work_period = WorkPeriod.find(params[:id])
  end

  def work_period_params
      params.require(:work_period).permit(:id, :start_time, :end_time, :title, :project_id)
  end

  def set_project
      @project = @user.projects.find(params[:project_id])
  end

  def fetch_all_work_periods
    @work_periods = WorkPeriod.with_project_details
  end
end
