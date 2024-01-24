Rails.application.routes.draw do

  options '*path', to: 'application#cors_preflight_check'

  post  '/password_reset', to: 'password_reset#create'
  # get '/password_reset', to: 'password_reset#edit'
  patch '/password_reset_edit/:token', to: 'password_reset#update'


  post  '/comments', to: 'comments#create'
  get '/comments', to: 'comments#index'
  get '/comments', to: 'comments#show'
  get '/comments', to: 'comments#destroy'
  resources :messages
  resources :chats
  resources :questions
  resources :users

    # Authentication routes
  # get 'auth', to: 'auth#index'
  post '/login', to: 'auth#create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
