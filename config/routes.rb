Rails.application.routes.draw do
  resources :users
  get 'users/validate_user', to: 'users#validate_user'
  post 'users/login', to: 'users#login'
  resources :growlists
  resources :wishlists
  resources :plants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end