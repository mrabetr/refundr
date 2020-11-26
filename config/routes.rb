Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :trips do
    resources :receipts, only: [:new, :create]
    resources :forms, only: [:create]
    
  end
  resources :receipts, only: [:show, :edit, :update, :destroy]
  resources :forms, only: [:index, :show]
  resources :items, only: :destroy

end
