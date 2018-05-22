class UserBudgetsController < ApplicationController
	def create
		budget = FamilyBudget.find(current_user.family_budget.id)
		@user_budget = UserBudget.create(family_budget: budget, user: params[:user])
		redirect_to root_path
	end

	def destroy
		@user_budget = User.find(params[:user_id]).user_budgets.first
		UserBudget.destroy(@user_budget.id)
		redirect_to root_path
	end
end
