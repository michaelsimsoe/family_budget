class BudgetUser < ApplicationRecord
	has_many :users
	has_many :budgets
end
