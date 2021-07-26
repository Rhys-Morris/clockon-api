class ExpensesController < ApplicationController
    before_action :set_project, only: %w[ index, create ]
    before_action :set_expense, only: %w[ update, destroy ]
    
    def index
        @expenses = @project.expenses
        render json: { expenses: @expenses }, status : 200
    end

    def create
        @expense = @project.expenses.create(expense_params)
        if @expense.valid?
            render json: { expenses: @project.expenses }, status: 201
        else
            render json: { error: @expense.errors.full_messages }
        end    
    end

    def update
        @expense = @expense.update(expense_params)
        if @expense.valid?
            render json: { expenses: @project.expenses }, status: 200
        else
            render json: { error: @expense.errors.full_messages }
        end   
    end

    def destroy
        @expense.destroy
        render json: { expenses: @project.expenses }, status: 200
    end

    private

    def set_expense
        @expense = expense.find(params[:id])
    end

    def expense_params
        params.require(:expense).permit(:id, :name, :date, :cost, :project_id)
    end

    def set_project
        project = @user.projects.find(params[:project_id])
    end
end
