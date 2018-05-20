class PeopleController < ApplicationController
	def index
		@family_budgets = FamilyBudget.all
		if !current_user.family_budget.present? && !current_user.family_budgets.present?
			redirect_to no_budget_path
			return
		end
		@people = current_user.family_budget.people
		@new_person_budget_notation = PersonBudgetNotation.new
	end

	def new
		@person = Person.new
	end

	def create
		@budget = current_user.owner_or_member_of_budget?
		amount = params[:disposable_amount]
		@person = Person.new(person_params)
		@person.family_budget_id = @budget.id
		if @person.save
			puts "success"
			redirect_to people_path
		end
	end

	def edit
		@person = Person.find(params[:id])
	end

	def update
		@person = Person.find(params[:id])
		if @person.update(person_params())
			redirect_to people_path
		else

		end
	end

	def show
		# @sub_budgets = current_user.family_budget.sub_budgets
	end

	def destroy
		@person = Person.find(params[:id])
		@person.destroy
		redirect_to people_path
	end

	private

	def person_params
    params.require(:person).permit(:name, :description, :disposable_amount)
  end
end
