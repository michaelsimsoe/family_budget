class PeopleController < ApplicationController
	def index
		@people = current_user.owner_or_member_of_budget?.people
		@new_person_budget_notation = PersonBudgetNotation.new
	end

	def new
		@person = Person.new
	end

	def create
		@budget = current_user.owner_or_member_of_budget?
		@person = Person.new(person_params)
		@person.family_budget_id = @budget.id
		if @person.save
			puts "success"
			redirect_to people_path
		else
		redirect_to new_person_path
		alertMessage = "Person was not created! "
 		if @person.errors.messages
 			if @person.errors.messages[:name].present?
 				alertMessage += "You need to specify a name for person. "
 			end
 			puts @person.errors.messages
 		end
 		flash[:alert] = alertMessage
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
		# @sub_budgets = current_user.owner_or_member_of_budget?.sub_budgets
	end

	def destroy
		@person = Person.find(params[:id])
		@person.destroy
		redirect_to people_path
	end

	private

	def person_params
    params.require(:person).permit(:name, :description)
  end
end
