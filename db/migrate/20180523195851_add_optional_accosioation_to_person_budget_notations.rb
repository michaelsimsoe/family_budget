class AddOptionalAccosioationToPersonBudgetNotations < ActiveRecord::Migration[5.2]
  def change
    add_reference :person_budget_notations, :sub_budget, foreign_key: true
  end
end
