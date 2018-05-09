class PersonBudgetNotationsController < ApplicationController

	def new
		@person = Person.new
	end

	def create
		@person_budget_notation = PersonBudgetNotation.new(person_budget_notation_params)
		if @person_budget_notation.save
			puts "success"
			redirect_to family_budget_path(@budget)
		end
	end

	private

	def person_budget_notation_params
    params.require(:person_budget_notation).permit(:title, :description, :amount, :type, :personn)
  end
end
