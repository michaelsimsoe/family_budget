class UserBudgetsController < ApplicationController
	def create
		budget = FamilyBudget.find(current_user.family_budget.id)
		@user_budget = UserBudget.create(family_budget: budget, user: params[:user])
		redirect_to root_path
	end

	def destroy
		@user_budget = User.find(params[:id]).user_budgets.first
		# UserBudget.destroy(@user_budget.id)
		if @user_budget.destroy
			respond_to do |format|
      	format.json { render :json => @user_budget }
      	format.js
   		end
   		flash[:alert] = "User removed"
   	else
   		flash[:alert] = "User could NOT be removed!"
   	end

	end
end
