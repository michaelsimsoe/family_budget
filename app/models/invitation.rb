class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :family_budget
end
