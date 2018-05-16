class ApplicationController < ActionController::Base
	before_action :authenticate_user!

	layout :layout_by_resource

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'new'
      "landing"
    else
      "application"
    end
  end
end
