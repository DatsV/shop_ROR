Rails.application.routes.draw do

  devise_for :users
  root 'main#index'

  resources :admin_users, :path => "admin-users"
  resources :admin_items, :path => "admin-items"

  resources :purchases
  resources :orders
  
  resources :search, only: %i[index]

  resources :main, only: %i[index show]

end
