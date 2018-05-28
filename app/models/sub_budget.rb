class SubBudget < ApplicationRecord
  belongs_to :family_budget
  has_many :sub_budget_notations, dependent: :destroy
  has_many :person_budget_notations, dependent: :destroy
  validates :title, presence: true

  def incomming
  	total_in = 0
  	self.sub_budget_notations.each do |n|
  		if n.notation_type == "deposit"
  			total_in += n.amount
  		end 
  	end

  	return total_in
  end

  def outgoing
  	total_out = 0
  	self.sub_budget_notations.each do |n|
  		if n.notation_type == "withdrawal" && n.amount != nil
  			total_out += n.amount
  		end 
  	end

  	return total_out
  end

  def balance
  	total_in = self.incomming
  	total_out = self.outgoing

  	return total_in - total_out
  end
end
