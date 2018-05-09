class SubBudgetsController < ApplicationController
	def index
	end
	def new
		@sub_budget = SubBudget.new
	end

	def create
		@budget = current_user.owner_or_member_of_budget?
		@sub_budget = SubBudget.new(sub_budget_params)
		@sub_budget.family_budget_id = @budget.id
		if @sub_budget.save
			puts "success"
			redirect_to family_budget_path(@budget)
		end
	end

	private

	def sub_budget_params
    params.require(:sub_budget).permit(:title, :description, :amount)
  end
end
