Rails.application.routes.draw do
  resources :questions
  resources :users

    # Authentication routes
  # get 'auth', to: 'auth#index'
  post '/login', to: 'auth#create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
