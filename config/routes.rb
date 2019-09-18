Rails.application.routes.draw do
  # devise_for :users
  resources :trucks
  resources :orders
  resources :customers
  resources :owners
  root to: 'devise/sessions#new'
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  # before_sign_in_path_for :user, to: "Devise::SessionsController#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
