class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  skip_before_action :user_has_budget?
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username])
  end
  
end