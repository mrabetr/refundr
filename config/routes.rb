Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :trips do
    resources :receipts, only: [:new, :create] do
      get :upload_photo, on: :collection
      post :create_photo, on: :collection
    end
    resources :forms, only: [:create]
  end

  resources :receipts, only: [:show, :edit, :update, :destroy] do
  	resources :items, only: [:new, :create]
    get :edit_photo, on: :member
    patch :update_photo, on: :member
  end
  resources :items, only: [:edit, :update, :destroy]
  resources :forms, only: [:index, :show]

end
