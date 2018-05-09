class DropSubBudgetTable < ActiveRecord::Migration[5.2]
  def change
  	drop_table :sub_budgets
  end
end
