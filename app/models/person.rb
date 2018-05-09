class Person < ApplicationRecord
  belongs_to :family_budget
  has_many :person_budget_notations
end
