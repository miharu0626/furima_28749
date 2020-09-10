Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:new, :create, :edit, :update]
  resources :items
  resources :shippings, only: [:new, :create]
  resources :purchases, only: [:create]
  
end
