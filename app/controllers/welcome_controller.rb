class WelcomeController < ApplicationController

	def index
		@family_budgets = FamilyBudget.all
		if !current_user.family_budget.present? && !current_user.family_budgets.present?
			puts "\nYou need a budget dickface!\n\n"
		end
	end
end