Rails.application.routes.draw do
  get 'members/index'
  get 'members/destroy'
  resources :member_requests
  resources :people
  resources :person_budget_notations
  resources :sub_budgets
  resources :sub_budget_notations
  get 'edit_sub_budget_notation/:id', to: 'sub_budget_notations_controller#edit'
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :family_budgets, only: [:new, :create, :destroy, :show, :edit, :update]
  resources :user_budgets, only: [:create, :destroy]
  get 'search_user', to: 'users#search'
  get 'no_budget', to: 'home#nobudget'
  post 'add_user', to: "users#add_user"
  post 'create_request', to: 'member_requests#create'
  post 'update_request', to: 'member_requests#update'
  post 'delete_request', to: 'member_requests#destroy'
end
