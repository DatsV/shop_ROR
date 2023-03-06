Rails.application.routes.draw do

  devise_for :users
  root 'main#index'
  
  resources :search, only: %i[index]

  resources :main, only: %i[index show]

end
