Rails.application.routes.draw do
  # get 'posts', to: 'items#index'
  #get 'items/index'
  #root 'application#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "items#index"
  resources :users, only: [:edit, :update, :create]
  resources :items
end
