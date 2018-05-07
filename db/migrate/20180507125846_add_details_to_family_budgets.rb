class AddDetailsToFamilyBudgets < ActiveRecord::Migration[5.2]
  def change
    add_column :family_budgets, :name, :string
    add_column :family_budgets, :description, :text
  end
end
