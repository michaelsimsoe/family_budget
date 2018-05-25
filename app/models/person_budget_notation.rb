class PersonBudgetNotation < ApplicationRecord
  belongs_to :person
  belongs_to :sub_budget, optional: true
  # belongs_to :sub_budget_notation, optional: true, dependent: :destroy
  validates :notation_type, :amount, presence: true
  validates :notation_type, format: { with: /deposit|withdrawal/, message: "must be deposit or withdrawal" }
end
