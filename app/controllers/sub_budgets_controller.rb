class SubBudgetsController < ApplicationController
	def index
		@family_budgets = FamilyBudget.all
		if !current_user.family_budget.present? && !current_user.family_budgets.present?
			redirect_to no_budget_path
			return
		end
		@sub_budgets = current_user.family_budget.sub_budgets
		@new_sub_budget_notation = SubBudgetNotation.new
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
			# redirect_to family_budget_path(@budget)
			redirect_to root_path
		end
	end

	def edit
		@sub_budget = SubBudget.find(params[:id])
	end

	def update
		@sub_budget = SubBudget.find(params[:id])
		if @sub_budget.update(sub_budget_params)
			redirect_to sub_budgets_path
		else

		end
	end

	def show
		@sub_budgets = current_user.family_budget.sub_budgets
	end

	def destroy
		@sub_budget = SubBudget.find(params[:id])
		@sub_budget.destroy
		redirect_to root_path
	end

	private

	def sub_budget_params
    params.require(:sub_budget).permit(:title, :description, :amount)
  end

end
