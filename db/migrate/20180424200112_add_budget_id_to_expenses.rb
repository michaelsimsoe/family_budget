class AddBudgetIdToExpenses < ActiveRecord::Migration[5.2]
  def change
  	add_column :expenses, :budget_id, :integer
  end
end
