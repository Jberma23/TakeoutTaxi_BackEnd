Rails.application.routes.draw do

  # devise_for :users
  resources :trucks
  # resources :orders
  resources :customers
  resources :owners
  resources :users
  resource :sessions, only: [:create, :destroy]
  root to: "users#index"
  
  devise_for :users
  # before_sign_in_path_for :user, to: "Devise::SessionsController#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
