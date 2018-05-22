class SubBudgetNotationsController < ApplicationController
		def index
		@sub_budget_notations = current_user.family_budget.sub_budgets.first.sub_budget_notations
		@new_sub_budget_notation = SubBudgetNotation.new
	end

	def new
		@new_sub_budget_notation = SubBudgetNotation.new
		puts "new"
	end

	def create
		# @sub_budget_id = params[:sub_budget_id]
		@sub_budget_notation = SubBudgetNotation.new(sub_budget_notation_params)
		# @sub_budget_notation.sub_budget_id = @sub_budget_id
		puts "create"
		if @sub_budget_notation.save
			respond_to do |format|
      	format.json { render :json => @sub_budget_notation }
      	format.js
   		end
   		flash[:notice] = "Notation has been created!"
   	else
   		flash[:alert] = "Notation was not created!"
		end
	end

	def edit
		@sub_budget_notation = SubBudgetNotation.find(params[:id])
	end

	def update
		@sub_budget_notation = SubBudgetNotation.find(params[:id])
		if @sub_budget_notation.update(sub_budget_notation_params)
			respond_to do |format|
      	format.json { render :json => @sub_budget_notation }
      	format.js
   		end
		else

		end
	end

	def destroy
		@sub_budget_notation = SubBudgetNotation.find(params[:id])
		if @sub_budget_notation.destroy
		 respond_to do |format|
      	format.json { render :json => @sub_budget_notation }
      	format.js
   		end
   		flash[:alert] = "Notation was deleted!"
   	else
   		flash[:alert] = "Notation could NOT be deleted!"
   	end
	end



	private

	def sub_budget_notation_params
    params.require(:sub_budget_notation).permit(:title, :description, :amount, :notation_type, :sub_budget_id)
  end
end
