Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #User Authentication routes
  namespace :api do
    resources :users, only:[:index, :create, :show]
    put 'update_profile', to: 'users#update'
  end

  post 'auth/login', to: 'authentication#login'
end
