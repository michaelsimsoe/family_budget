class CreateBudgetUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :budget_users do |t|

      t.timestamps
    end
  end
end
