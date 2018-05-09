class SubBudgetNotationsController < ApplicationController
	def new
		@sub_budget_notation = SubBudgetNotation.new
	end

	def create
		@sub_budget = SubBudget.first
		@sub_budget_notation = SubBudgetNotation.new(sub_budget_notation_params)
		@sub_budget_notation.sub_budget_id = @sub_budget.id
		if @sub_budget_notation.save
			puts "success"
			redirect_to root_path
		end
	end

	private

	def sub_budget_notation_params
    params.require(:sub_budget_notation).permit(:title, :description, :amount, :notation_type)
  end
end
