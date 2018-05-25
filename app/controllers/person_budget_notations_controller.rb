class PersonBudgetNotationsController < ApplicationController

	def index

	end

	def new
		@person_budget_notation = PersonBudgetNotation.new
		@family_budget = current_user.owner_or_member_of_budget?
	end

	def create

		@person_budget_notation = PersonBudgetNotation.new(person_budget_notation_params)
		createSubBudgetNotation = false
		sub_budget = ""
		this_sub_budget_id = ""

		# Set SubBudgetId if it exists
		if person_budget_notation_params["sub_budget_id"].present?
			createSubBudgetNotation = true
			sub_budget = SubBudget.where("title like ?", person_budget_notation_params["sub_budget_id"])
			this_sub_budget_id = sub_budget.first.id
			@person_budget_notation.sub_budget_id = this_sub_budget_id
		end

		if @person_budget_notation.save
			respond_to do |format|
      	format.json { render :json => @person_budget_notation }
      	format.js
   		end
   		flash[:notice] = "Notation has been created!"
   	else
   		if @person_budget_notation.errors.messages
   			puts @person_budget_notation.errors.messages[:notation_type][0]
   		end
   		flash[:alert] = "Notation was not created!"
		end

		# Create SubBudgetNotation..
		if createSubBudgetNotation
								
			SubBudgetNotation.create(sub_budget_id:this_sub_budget_id, 
				title:"From #{@person_budget_notation.person.name}", 
				description: person_budget_notation_params["description"], 
				amount:person_budget_notation_params["amount"], 
				notation_type:"deposit",
				person_budget_notation_id: @person_budget_notation.id)
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
		@sub_budget_notation = SubBudgetNotation.where("person_budget_notation_id like ?", params[:id]).first
		if @person_budget_notation.destroy
		 respond_to do |format|
      	format.json { render :json => @person_budget_notation }
      	format.js
   		end
   		@sub_budget_notation.destroy
   		flash[:alert] = "Notation was deleted!"
   	else
   		flash[:alert] = "Notation could NOT be deleted!"
   	end

   	


	end

	private

	def person_budget_notation_params
    params.require(:person_budget_notation).permit(:title, :description, :amount, :notation_type, :person_id, :sub_budget_id)
  end
end
