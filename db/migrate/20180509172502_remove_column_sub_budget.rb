class RemoveColumnSubBudget < ActiveRecord::Migration[5.2]
  def change
  	remove_column :sub_budgets, :type
  end
end
