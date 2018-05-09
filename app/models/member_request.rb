class MemberRequest < ApplicationRecord
  belongs_to :family_budget
  belongs_to :user
end
