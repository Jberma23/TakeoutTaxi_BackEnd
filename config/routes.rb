Rails.application.routes.draw do
  
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }
  # post '/user_token' => 'user_token#create'

  resources :trucks
  # resources :orders
  resources :customers
  resources :owners


  # after_sign_in_path_for :user, to: "users#show"
  root to: 'users#index'
  
  # devise_for :users
  # before_sign_in_path_for :user, to: "Devise::SessionsController#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
