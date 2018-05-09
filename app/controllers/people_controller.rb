class PeopleController < ApplicationController
	def index 
		
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
			redirect_to family_budget_path(@budget)
		end
	end

	private

	def person_params
    params.require(:person).permit(:name, :description, :disposable_amount)
  end
end
