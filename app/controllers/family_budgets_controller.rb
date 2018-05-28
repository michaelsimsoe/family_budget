class FamilyBudgetsController < ApplicationController
	skip_before_action :user_has_budget?, only: [:new, :create]
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
		else
			redirect_to new_family_budget_path
			alertMessage = "Budget was not created! "
   		if @family_budget.errors.messages
   			if @family_budget.errors.messages[:name].present?
   				alertMessage += "You need to specify a name for this budget. "
   			end
   			puts @family_budget.errors.messages
   		end
   		flash[:alert] = alertMessage
		end
	end

	def edit
		@family_budget = FamilyBudget.find(params[:id])
		@members = @family_budget.users
	end

	def update
		@family_budget = FamilyBudget.find(params[:id])
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

	def destroy
		@family_budget = FamilyBudget.find(params[:id])
		@family_budget.destroy
		redirect_to root_path
	end

	private

	def budget_params
    params.require(:family_budget).permit(:name, :description)
  end

end
