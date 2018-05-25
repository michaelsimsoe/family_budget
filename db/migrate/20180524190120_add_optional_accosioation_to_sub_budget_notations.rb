class AddOptionalAccosioationToSubBudgetNotations < ActiveRecord::Migration[5.2]
  def change
    add_reference :sub_budget_notations, :person_budget_notation, foreign_key: true
  end
end
