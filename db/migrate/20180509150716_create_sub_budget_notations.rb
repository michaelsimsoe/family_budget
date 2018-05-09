class CreateSubBudgetNotations < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_budget_notations do |t|
      t.references :sub_budget, foreign_key: true
      t.string :title
      t.text :description
      t.string :type
      t.integer :amount
      t.timestamps
    end
  end
end
