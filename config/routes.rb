Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  post 'weather', to: 'pages#weather', as: :weather

  resources :trips do
    resources :receipts, only: [:new, :create] do
      get :new_photo, on: :collection
      post :create_photo, on: :collection
    end
    resources :forms, only: [:create]
  end

  resources :receipts, only: [:show, :edit, :update, :destroy] do
    get :edit_photo, on: :member
    patch :update_photo, on: :member
  end

  resources :forms, only: [:index, :show] do
    get :display
  end
  resources :items, only: [:edit, :update, :destroy]
end
