class BudgetsController < ApplicationController

	def index
		@budgets = Budget.all.order("created_at DESC")
	end

	def new
		@budget = Budget.new
	end

	def create
		@budget = Budget.new(budget_params)

		if @budget.save
			redirect_to @budget
		else
			render 'new'
		end
	end

	def show 
		@budget = Budget.find(params[:id])
	end

	def update
		@budget = Budget.find(params[:id])

		if @budget.update(budget_params)
			redirect_to @budget
		else
			redner 'edit'
		end
	end

	def edit
		@budget = Budget.find(params[:id])
	end

	def destroy
		@budget = Budget.find(params[:id])
		@budget.destroy

		redirect_to budgets_path
	end

	private

	def budget_params
		params.require(:budget).permit(:name, :description)
	end

end
