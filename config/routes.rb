Rails.application.routes.draw do
  devise_for :users

  resources :categories, except: %i[destroy] do
    resources :pictures, only: %i[index]
  end

  resources :pictures, only: %i[index show] do
    resources :negative_likes, only: %i[create]
    resources :positive_likes, only: %i[create]
    resources :comments, only: %i[create]
  end

  resource :users, only: %i[show edit update]

  root to: 'categories#index'
end
