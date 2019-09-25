Rails.application.routes.draw do
  resources :favorites
  resources :reviews 
  resources :ratings
  resources :trucks
  resources :orders
  resources :customers
  resources :owners
  resource :users
  # devise_for :users
  # _sign_in_path_for :user, to: "users#show"
  root to: 'users#index'
  # post '/sign_in', to: "sessions#create"
  get 'users/all', to: 'users#all'
  devise_for :users, :controllers => {registrations: 'registrations', sessions: 'user/sessions'}
  # devise_for :users
  # before_sign_in_path_for :user, to: "Devise::SessionsController#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
