class PersonBudgetNotationsController < ApplicationController

	def index

	end

	def new
		@person_budget_notation = PersonBudgetNotation.new
	end

	def create
		@person = Person.first
		@person_budget_notation = PersonBudgetNotation.new(person_budget_notation_params)
		@person_budget_notation.person_id = @person.id
		if @person_budget_notation.save
			puts "success"
			redirect_to root_path
		end
	end

	private

	def person_budget_notation_params
    params.require(:person_budget_notation).permit(:title, :description, :amount, :notation_type, :person)
  end
end
