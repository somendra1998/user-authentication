Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #User Authentication routes
  namespace :api do
    resources :users, only:[:index, :create, :show]
    put 'update_profile', to: 'users#update'
    post 'login',  to: 'logins#create'
  end

  namespace :admin do
    post 'login',  to: 'admin_logins#create'
  end

end
