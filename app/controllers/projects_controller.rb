class ProjectsController < ApplicationController
  before_action :set_project, only: %w[destroy edit update]

  def index
    render json: { project: fetch_all_projects }, status: 200
  end

  def create
    @project = @user.projects.create(project_params)
    if @project.valid?
      render json: { project: fetch_all_projects }, status: 201
    else
      render json: { error: @project.errors.full_messages }
    end
  end

  def update
    if @project.update(project_params)
      render json: { projects: fetch_all_projects }, status: 200
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
    params.require(:project).permit(:name, :color, :due_date, :active, :id, :billable, :project_id, :user_id, :hours)
  end
  
  def set_project
    @roject = @user.projects.find(params[:id]) 
  end

  def fetch_all_projects
    @projects = @user.projects.all
  end
end
