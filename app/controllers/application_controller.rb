class ApplicationController < ActionController::Base
	before_action :authenticate_user!, :user_has_budget?


	layout :layout_by_resource

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'new'
      "landing"
    else
      "application"
    end
  end

  private

  def user_has_budget?
  	if !current_user.family_budget.present? && !current_user.family_budgets.present?
			redirect_to no_budget_path
		end
		puts "yooooooooooooooooo!"
  end
end
