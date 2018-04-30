class Budget < ApplicationRecord
	belongs_to :user
	has_many :expenses
	has_many :budget_users
	has_many :users, through: :budget_users
end
