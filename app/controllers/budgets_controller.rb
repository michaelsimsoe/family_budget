class BudgetsController < ApplicationController
	before_action :require_user, only: [:index, :new, :show]
	before_action :require_same_user, only: [:show, :edit, :update, :destroy]

	def index
		@budgets = current_user.budgets.all.order("created_at DESC")
	end

	def new
		@budget = Budget.new
	end

	def create
		@budget = Budget.new(budget_params)
		@budget.user = current_user
		@users = User.all
		if @budget.save
			redirect_to @budget
		else
			render 'new'
		end
	end

	def show 
		@budget = Budget.find(params[:id])
		@total_expense = count_expenses
	end

	def update
		@budget = Budget.find(params[:id])
		@users = User.all
		if @budget.update(budget_params)
			redirect_to @budget
		else
			render 'edit'
		end
	end

	def edit
		@budget = Budget.find(params[:id])
		@users = User.all
	end

	def destroy
		@budget = Budget.find(params[:id])
		@budget.destroy

		redirect_to budgets_path
	end

	private

	def budget_params
		params.require(:budget).permit(:name, :description)
	end

	def require_same_user
		@budget = Budget.find(params[:id])
    if current_user.id != @budget.user_id
      # flash[:danger] = "You can only edit or delete your own article"
      redirect_to budgets_path
    end
  end

  def count_expenses
  	@budget = Budget.find(params[:id])
  	@total = 0
  	@budget.expenses.each do |e|
  		@total = @total + e.amount
  	end
  	return @total
  end

end
