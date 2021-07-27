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
    render json: { project: Project.with_client_name(@project.id), tasks: @project.tasks, expenses: @project.expenses }, status: 200
  end

  def update
    if @project.update(project_params)
      render json: { project: Project.with_client_name(@project.id) }, status: 200
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

  private

  def project_params
    params.require(:project).permit(:name, :color, :due_date, :active, :id, :billable, :project_id, :client_id, :hours)
  end
  
  def set_project
    @project = @user.projects.find(params[:id])
  end

  def fetch_all_projects
    @projects = @user.projects.with_client_names
  end
end
