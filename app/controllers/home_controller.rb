class HomeController < ApplicationController

	def index
		@family_budgets = FamilyBudget.all
		@sub_budgets = current_user.family_budget.sub_budgets
		@new_sub_budget_notation = SubBudgetNotation.new
		if !current_user.family_budget.present? && !current_user.family_budgets.present?
			puts "\nYou need a budget dickface!\n\n"
		end
	end
end