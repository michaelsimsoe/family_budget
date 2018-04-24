Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :budgets do
  	resources :expenses
  end

  root "budgets#index"
end
