class WorkPeriodsController < ApplicationController
  before_action :set_work_period, only: [:destroy]
  before_action :set_project, only: [:create, :destroy, :invoice]
  before_action :fetch_all_work_periods, only: [:index]
  
  def index
    render json: { work_periods: @work_periods }
  end

  def create
    @work_period = @user.work_periods.create(work_period_params)
      if @work_period.valid?
        render json: { work_periods: fetch_all_work_periods }, status: 201
      else
        render json: { error: @work_period.errors.full_messages }
      end    
  end

  def destroy
    @work_period.destroy
    render json: { work_periods: fetch_all_work_periods }, status: 200
  end

  def invoice
    begin
      WorkPeriod.invoice_all
      render json: { work_periods: @project.work_periods }
    rescue => e
       render json: { error: e }
    end
  end

  private

  def set_work_period
    @work_period = WorkPeriod.find(params[:id])
  end

  def work_period_params
    params.require(:work_period).permit(:id, :start_time, :end_time, :title, :invoiced, :project_id)
  end

  def set_project
    @project = @user.projects.find(params[:project_id])
  end

  def fetch_all_work_periods
    @work_periods = @user.work_periods.with_project_details
  end
end
