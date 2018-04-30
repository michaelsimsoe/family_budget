class AddFieldsToTable < ActiveRecord::Migration[5.2]
  def change
    add_column :budget_users, :budget_id, :integer
    add_column :budget_users, :user_id, :integer
  end
end
