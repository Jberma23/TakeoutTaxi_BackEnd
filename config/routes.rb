Rails.application.routes.draw do
post '/rails/active_storage/direct_uploads', to: 'direct_uploads#create'
  get 'location/create'
 resources :locations
  resources :favorites
  resources :reviews 
  resources :ratings
  resources :trucks
  resources :orders
  resources :customers
  resources :owners
  resource :users
  resources :direct_uploads
  devise_for :users, controllers: { sessions: 'users/sessions'}
  
  # , controllers: { sessions: 'sessions' }
  # _sign_in_path_for :user, to: "users#show"
  root to: 'users#index'
  # post '/sign_in', to: "sessions#create"
  # resources :sessions, only: [:create, :destroy]
  # devise_for :users
  # before_sign_in_path_for :user, to: "Devise::SessionsController#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
