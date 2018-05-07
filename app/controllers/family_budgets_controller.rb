class FamilyBudgetsController < ApplicationController
	def new 
		@family_budget = FamilyBudget.new
	end
	def create
		@family_budget = FamilyBudget.new(budget_params)
		@family_budget.user = current_user
		if @family_budget.save
			puts "success"
			redirect_to family_budget_path(@family_budget) 
		end
	end

	def show
		@family_budget = FamilyBudget.find(params[:id])
	end

	private

	def budget_params
    params.require(:family_budget).permit(:name, :description)
  end
end
