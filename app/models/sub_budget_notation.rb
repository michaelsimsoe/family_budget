class SubBudgetNotation < ApplicationRecord
  belongs_to :sub_budget
  belongs_to :person_budget_notation, optional: true, dependent: :destroy
  validates :notation_type, :amount, presence: true
  validates :notation_type, format: { with: /deposit|withdrawal/, message: "must be deposit or withdrawal" }

  def is_deposit_or_withdrawal
  end
end
