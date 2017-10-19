Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  devise_for :users, controllers: { sessions: 'sessions' }

  resources :categories do
    resources :pictures, only: [:index]
  end

  resources :pictures, only: [:index, :show] do
    resources :likes, only: [:create]
  end
  resources :comments, only: [:index, :create]

  resources :events, except: [:show] do
    get 'show/:event_type', on: :member, action: :show, as: :show
  end

  resources :users, only: [:show, :edit, :update]

  root to: 'categories#index'
end
