class CreateUserBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :user_budgets do |t|
      t.references :user, foreign_key: true
      t.references :family_budget, foreign_key: true

      t.timestamps
    end
  end
end
