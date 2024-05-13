Rails.application.routes.draw do
  devise_for :users

  #profile routes
  get 'profile', to: 'profile#show', as: 'profile_show'
  root to: 'profile#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #Set root for something
  # Defines the root path route ("/")
  # root "articles#index"
end
