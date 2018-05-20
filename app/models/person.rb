class Person < ApplicationRecord
  belongs_to :family_budget
  has_many :person_budget_notations

  def total_out
  	total = 0
  	self.person_budget_notations.each do |n|
  		if n.amount.present?
  			total += n.amount
  		end
  	end
  	return total
  end

  def rest
  	out = self.total_out
  	disposable = self.disposable_amount
  	return disposable - out
  end
end
