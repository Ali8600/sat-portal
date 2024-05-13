Rails.application.routes.draw do
  devise_for :users

  #profile routes
  get 'profile', to: 'profile#show', as: 'profile_show'
  root to: 'profile#show'

end
