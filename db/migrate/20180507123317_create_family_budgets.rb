class CreateFamilyBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :family_budgets do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
