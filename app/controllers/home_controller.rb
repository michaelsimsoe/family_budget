class HomeController < ApplicationController
	skip_before_action :user_has_budget?, only: :nobudget
	def index
		@family_budgets = FamilyBudget.all
		if !current_user.family_budget.present? && !current_user.family_budgets.present?
			redirect_to no_budget_path
			return
		end
		@sub_budgets = current_user.owner_or_member_of_budget?.sub_budgets
		@new_sub_budget_notation = SubBudgetNotation.new
		@people = current_user.owner_or_member_of_budget?.people
		@new_person_budget_notation = PersonBudgetNotation.new
	
	end

	def nobudget
		@family_budget = current_user.owner_or_member_of_budget?
		@family_budgets = FamilyBudget.all
		if @family_budget == nil
			puts "\nNo Budget\n\n"
			render "nobudget"
		else
			redirect_to root_path
		end
	end
		
		
end