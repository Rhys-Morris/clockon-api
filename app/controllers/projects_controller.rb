class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ destroy show edit update ]

  def index
    render json: { projects: fetch_all_projects }, status: 200
  end

  def create
    @project = @user.projects.create(project_params)
    if @project.valid?
      render json: { projects: fetch_all_projects }, status: 201
    else
      render json: { error: @project.errors.full_messages }
    end
  end

  def show
    render json: { project: Project.with_additional_details(@project.id), tasks: @project.tasks, expenses: map_expense_receipts(@project.expenses) }, status: 200
  end

  def update
    if @project.update(project_params)
      render json: { project: Project.with_additional_details(@project.id), tasks: @project.tasks, expenses: map_expense_receipts(@project.expenses) }, status: 200
    else
      error = @project.errors.full_messages
      set_project
      render json: { error: error, project: @project }
    end
  end

  def destroy
    @project.destroy
    render json: { projects: fetch_all_projects }, status: 200
  end

  def update_rates
    Project.where(billable_rate: params[:project][:previous_rate]).update_all(billable_rate: params[:project][:billable_rate])
    render json: { message: "success" }, status: :ok
  end

  private

  def project_params
    params.require(:project).permit(:name, :color, :due_date, :active, :id, :billable, :project_id, :client_id, :hours, :billable_rate, :previous_rate)
  end
  
  def set_project
    @project = @user.projects.find(params[:id])
  end

  def fetch_all_projects
    @projects = @user.projects.with_client_and_hours
  end

  def map_expense_receipts expenses
    expenses.to_a.map(&:serializable_hash).each do |exp|
      instance = Expense.find(exp["id"])
      exp[:receipt_url] = url_for(instance.receipt) if instance.receipt.attached?
    end
  end
end
