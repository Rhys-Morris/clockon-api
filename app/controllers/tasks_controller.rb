class TasksController < ApplicationController
    before_action :set_project, only: %w[ index, create ]
    before_action :set_task, only: %w[ update, destroy ]
    
    def index
        @tasks = @project.tasks
        render json: { tasks: @tasks }, status : 200
    end

    def create
        @task = @project.tasks.create(task_params)
        if @task.valid?
            render json: { tasks: @project.tasks }, status: 201
        else
            render json: { error: @task.errors.full_messages }
        end    
    end

    def update
        @task = @task.update(task_params)
        if @task.valid?
            render json: { tasks: @project.tasks }, status: 200
        else
            render json: { error: @task.errors.full_messages }
        end   
    end

    def destroy
        @task.destroy
        render json: { tasks: @project.tasks }, status: 200
    end

    private

    def set_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:id, :title, :due_date, :estimated_hours, :project_id)
    end

    def set_project
        project = @user.projects.find(params[:project_id])
    end
end
