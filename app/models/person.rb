class Person < ApplicationRecord
  belongs_to :family_budget
  has_many :person_budget_notations

  def total_in
    total_in = 0
    self.person_budget_notations.each do |n|
      if n.notation_type == "deposit" && n.amount != nil
        total_in += n.amount
      end 
    end

    return total_in
  end

  def total_out
    total_out = 0
    self.person_budget_notations.each do |n|
      if n.notation_type == "withdrawal" && n.amount != nil
        total_out += n.amount
      end 
    end

    return total_out
  end

  def rest
  	out = self.total_out
  	disposable = self.total_in
    if disposable != nil
  	rest =  disposable - out
      return rest
    else
      return nil
    end
  end
end
