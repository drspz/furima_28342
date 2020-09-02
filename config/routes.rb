Rails.application.routes.draw do
  # get 'posts', to: 'items#index'
  #get 'items/index'
  #root 'application#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  # root to: 'orders#index'
  resources :items do
    resources :orders, only: [:create, :index]
  end
  # resources :orders
  resources :users, only: [:show, :edit, :update, :create]
  # resources :items
end
