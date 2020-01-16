Rails.application.routes.draw do
  resources :plant_growths
  resources :users
  get 'users/validate_user', to: 'users#validate_user'
  post 'users/login', to: 'users#login'
  resources :growlists
  resources :wishlists
  resources :plants
end