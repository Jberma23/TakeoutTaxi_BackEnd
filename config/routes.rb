Rails.application.routes.draw do
  get 'favorites/index'
  get 'favorites/new'
  get 'favorites/create'
  get 'favorites/destory'
  get 'favorites/update'
  get 'reviews/index'
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/destory'
  get 'reviews/update'
  get 'ratings/index'
  get 'ratings/new'
  get 'ratings/create'
  get 'ratings/destory'
  get 'ratings/update'
  resources :trucks
  resources :orders
  resources :customers
  resources :owners
  resource :users
  # devise_for :users
  # _sign_in_path_for :user, to: "users#show"
  root to: 'users#index'
  # post '/sign_in', to: "sessions#create"

  devise_for :users, :controllers => {registrations: 'registrations', sessions: 'user/sessions'}
  # devise_for :users
  # before_sign_in_path_for :user, to: "Devise::SessionsController#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
