class FamilyBudget < ApplicationRecord
  belongs_to :user
  has_many :user_budgets, dependent: :destroy
  has_many :users, through: :user_budgets
  has_many :member_requests
  has_many :people, dependent: :destroy
  has_many :sub_budgets, dependent: :destroy
  has_many :pending_members, through: :member_requests, source: :user
  has_many :invitations, dependent: :destroy
  # has_many :memberships, dependent: :destroy
  # has_many :members, through: :memberships
  
  def owner_of_budget
    user = User.find(self.user_id)
    user.full_name
  end

  def total_in_to_budget
  	total_in = 0
  	self.sub_budgets.each do |sb|
  		total_in += sb.incomming
  	end

  	return total_in
  end

  def total_out_from_budget
  	total_out = 0
  	self.sub_budgets.each do |sb|
  		total_out += sb.outgoing
  	end

  	return total_out
  end

  def balance
  	return self.total_in_to_budget - self.total_out_from_budget
  end

  def getAllNotations
    notations = []
    self.sub_budgets.each do |sb|
      sb.sub_budget_notations.each do |sbn|
        notations << sbn
      end
    end

    notations_json = notations.to_json
    return notations_json.html_safe
  end

end
