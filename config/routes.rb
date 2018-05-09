Rails.application.routes.draw do
  get 'members/index'
  get 'members/destroy'
  resources :member_requests
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :family_budgets, only: [:new, :create, :destroy, :show, :edit, :update]
  resources :user_budgets, only: [:create]
  get 'search_user', to: 'users#search'
  post 'add_user', to: "users#add_user"
  post 'create_request', to: 'member_requests#create'
  post 'update_request', to: 'member_requests#update'
  post 'delete_request', to: 'member_requests#destroy'
end
