class ExpensesController < ApplicationController

	def create 
		@budget = Budget.find(params[:budget_id])
		@expense = @budget.expenses.create(params[:expense].permit(:title, :description, :amount))
		redirect_to budget_path(@budget)
	end

	def destroy
		@budget = Budget.find(params[:budget_id])
		@expense = @budget.expenses.find(params[:id])
		@expense.destroy
		redirect_to budget_path(@budget)
	end
end
