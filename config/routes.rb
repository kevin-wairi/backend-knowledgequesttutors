Rails.application.routes.draw do
  get '/activity', to: 'activity#index'
  post '/activity', to: 'activity#create'
  get '/activity/:user_id', to: 'activity#show'
  delete '/activity/:user_id', to: 'activity#destroy'

  post  '/password_reset', to: 'password_reset#create'
  # get '/password_reset', to: 'password_reset#edit'
  patch '/password_reset_edit/:token', to: 'password_reset#update'


  resources :comments, only: [:index, :show, :create, :destroy]
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
