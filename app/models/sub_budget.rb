class SubBudget < ApplicationRecord
  belongs_to :family_budget
  has_many :sub_budget_notations
end
