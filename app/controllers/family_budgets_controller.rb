class FamilyBudgetsController < ApplicationController
	def new
		@family_budget = current_user.owner_or_member_of_budget?
		if @family_budget != nil
			puts "\nYou already have a budget\nFuck off!\n\n"
			redirect_to root_path
		end
		@family_budget = FamilyBudget.new
	end
	
	def create
		@family_budget = FamilyBudget.new(budget_params)
		@family_budget.user = current_user
		if @family_budget.save
			puts "success"
			redirect_to root_path
		end
	end

	def edit
		@family_budget = current_user.owner_or_member_of_budget?
	end

	def update
		@family_budget = current_user.owner_or_member_of_budget?
		if @family_budget.update(budget_params)
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def show
		@family_budget = current_user.owner_or_member_of_budget?

		if @family_budget == nil
			puts "\nNo Budget\n\n"
			redirect_to root_path
			return
		end
		
	end

	private

	def budget_params
    params.require(:family_budget).permit(:name, :description)
  end

end
