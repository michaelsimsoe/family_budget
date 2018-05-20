class PersonBudgetNotationsController < ApplicationController

	def index

	end

	def new
		@person_budget_notation = PersonBudgetNotation.new
	end

	def create
		# @sub_budget_id = params[:sub_budget_id]
		@person_budget_notation = PersonBudgetNotation.new(person_budget_notation_params)
		# @sub_budget_notation.sub_budget_id = @sub_budget_id
		puts "create"
		if @person_budget_notation.save
			respond_to do |format|
      	format.json { render :json => @person_budget_notation }
      	format.js
   		end
		end
	end

	def edit
		@person_budget_notation = PersonBudgetNotation.find(params[:id])
	end

	def update
		@person_budget_notation = PersonBudgetNotation.find(params[:id])
		if @person_budget_notation.update(person_budget_notation_params)
			respond_to do |format|
      	format.json { render :json => @person_budget_notation }
      	format.js
   		end
		else

		end
	end

	def destroy
		@person_budget_notation = PersonBudgetNotation.find(params[:id])
		if @person_budget_notation.destroy
		 respond_to do |format|
      	format.json { render :json => @person_budget_notation }
      	format.js
   		end
   	else

   	end
	end

	private

	def person_budget_notation_params
    params.require(:person_budget_notation).permit(:title, :description, :amount, :notation_type, :person_id)
  end
end
