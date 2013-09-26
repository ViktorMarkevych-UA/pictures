Analitics::Application.routes.draw do

  devise_for :users, :controllers => { :sessions => "sessions" }

  resources :categories do
    resources :pictures, :only => [:index]
  end

  resources :pictures, :only => [:index, :show] do
    resources :likes, :only => [:create]
  end
  resources :comments, :only => [:index, :create]

  resources :event, :except => [:show] do
    get 'show/:event_type', :on => :member, :action => :show, :as => :show
  end

  root :to => 'categories#index'
end
