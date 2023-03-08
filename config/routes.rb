Rails.application.routes.draw do

  devise_for :users
  root 'main#index'

  resources :admin_users, :path => "admin-users"
  resources :admin_items, :path => "admin-items"
  
  resources :purchases

  post '/order', to: 'orders#create'

  get "/cart", to: 'cart#index'
  post "/cart", to: 'cart#create'
  patch "/cart", to: 'cart#update'
  delete "/cart/:product_id", to: 'cart#destroy'
  
  resources :search, only: %i[index]

  resources :main, only: %i[index show]

end
