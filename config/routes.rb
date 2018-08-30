Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  devise_for :users

  resources :categories, except: %i[:destroy] do
    resources :pictures, only: [:index]
  end

  resources :pictures, only: [:index, :show] do
    resources :negative_likes, only: [:create]
    resources :positive_likes, only: [:create]
  end
  resources :comments, only: [:index, :create]

  resource :users, only: [:show, :edit, :update]

  root to: 'categories#index'
end
