class FamilyBudget < ApplicationRecord
  belongs_to :user
  has_many :user_budgets
  has_many :users, through: :user_budgets
  has_many :member_requests
  has_many :people
  has_many :sub_budgets
  has_many :pending_members, through: :member_requests, source: :user
  # has_many :memberships, dependent: :destroy
  # has_many :members, through: :memberships
end
