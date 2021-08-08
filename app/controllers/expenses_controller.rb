class ExpensesController < ApplicationController
    before_action :set_project, only: [:create, :update, :destroy, :purge_receipt ]
    before_action :set_expense, only: [:update, :destroy, :purge_receipt ]
    
    def create
        @expense = @project.expenses.create(expense_params)
        if @expense.valid?
            render json: { expenses: map_expense_receipts(@project.expenses) }, status: 201
        else
            render json: { error: @expense.errors.full_messages }
        end    
    end

    def update
        puts @expense
        if @expense.update(expense_params)
            render json: { expenses: map_expense_receipts(@project.expenses) }, status: 200
        else
            render json: { error: @expense.errors.full_messages }
        end   
    end

    def destroy
        @expense.destroy
        render json: { expenses: map_expense_receipts(@project.expenses) }, status: 200
    end

    def purge_receipt
        @expense.receipt.purge
        render json: { expenses: map_expense_receipts(@project.expenses) }, status: 200
    end

    private

    def set_expense
        @expense = Expense.find(params[:id])
    end

    def expense_params
        params.permit(:id, :name, :date, :cost, :project_id, :receipt)
    end

    def set_project
        @project = @user.projects.find(params[:project_id])
    end

    def map_expense_receipts expenses
        expenses.to_a.map(&:serializable_hash).each do |exp|
          instance = Expense.find(exp["id"])
          exp[:receipt_url] = url_for(instance.receipt) if instance.receipt.attached?
        end
      end
end
