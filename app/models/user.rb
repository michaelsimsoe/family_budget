class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :family_budget
  has_many :user_budgets
  has_many :family_budgets, through: :user_budgets
  has_many :member_requests, dependent: :destroy
  # has_many :invitations, dependent: :destroy
  has_many :pending_invitations, through: :invitations, source: :family_budget

  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
    "Anonymous"
  end

  # Check if user has access to budget by beeing the creator, or a member through UserBudget.
  def owner_or_member_of_budget?
    # puts self.family_budgets.first.present?
    if self.family_budget.present?
      budget = FamilyBudget.find(self.family_budget.id)
    elsif self.family_budgets.first.present?
      budget = FamilyBudget.find(self.family_budgets.first.id)
    else
      budget = nil
    end
    return budget
  end

  def except_current_user(users)
    users.reject { |user| user.id == self.id }
  end

  def exclude_if_has_budget(users)
    users.reject { |user| user.owner_or_member_of_budget? != nil }
  end

  def self.search(param)
    param.strip!
    param.downcase!
    to_send_back = (first_name_matches(param) + last_name_matches(param) + email_matches(param)).uniq
    return nil unless to_send_back
    to_send_back
  end
  
  def self.first_name_matches(param)
    matches('first_name', param)
  end
  
  def self.last_name_matches(param)
    matches('last_name', param)
  end
  
  def self.email_matches(param)
    matches('email', param)
  end
  
  def self.matches(field_name, param)
    where("#{field_name} like ?", "%#{param}%")
  end

  def has_invitation?
    invitation = Invitation.find_by user_id: self.id
    true unless invitation == nil
  end

  def invitation
    invitation = Invitation.find_by user_id: self.id
    invitation
  end
end
