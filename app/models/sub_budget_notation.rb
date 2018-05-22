class SubBudgetNotation < ApplicationRecord
  belongs_to :sub_budget
  validates :notation_type, :amount, presence: true
  validates :notation_type, format: { with: /deposit|withdrawal/, message: "must be deposit or withdrawal" }

  def is_deposit_or_withdrawal
  end
end
