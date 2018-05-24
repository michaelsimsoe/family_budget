class SessionsController < Devise::SessionsController
  skip_before_action :user_has_budget?
end