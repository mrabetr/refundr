Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :trips do
    resources :receipts, only: [:new, :create]
    resources :forms, only: [:create, :show]
  end

  resources :receipts, only: [:show, :edit, :update, :destroy] do
  	resources :items, only: [:new, :create]
  end

  resources :items, only: [:edit, :update, :destroy]
end
