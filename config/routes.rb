Rails.application.routes.draw do
  match '*all', to: proc { [204, {}, ['']]}, via: :options
  # get 'welcome_page/welcome'
  post '/rails/active_storage/direct_uploads', to: 'direct_uploads#create'
  # get 'location/create'
  resources :locations
  resources :favorites
  resources :reviews 
  resources :ratings
  resources :trucks
  resources :orders
  # resources :customers
  # resources :owners
  resources :menus
  resources :categories
  resources :items
  resources :users

  # resource :updates
  resources :direct_uploads
  devise_for :users,
    controllers: {
    registrations:  "users/registrations",
    confirmations:  "users/confirmations",
    sessions:       "users/sessions",
    passwords:      "users/passwords",
  }, :path_names => {:sign_in => "login", :sign_out => "logout"}
  get 'welcome_page/welcome'
  root 'welcome_page#welcome'
  get '/updates', to: 'updates#index'
  post '/updates', to: 'updates#create'
  post '/payments', to: 'payments#create'
  # get '/users', to: 'users#show'
  # , controllers: { sessions: 'sessions' }
  # _sign_in_path_for :user, to: "users#show"
  # root to: 'users#index'
  # post '/sign_in', to: "sessions#create"
  # resources :sessions, only: [:create, :destroy]
  # devise_for :users
  # before_sign_in_path_for :user, to: "Devise::SessionsController#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
