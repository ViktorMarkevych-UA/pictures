Analitics::Application.routes.draw do

  devise_for :users, :controllers => { :sessions => "sessions" }

  resources :categories do
    post 'random/:category_id', :on => :collection, :action => :rand_method, :as => :random
  end

  resources :pictures, :only => [:index, :show] do
    resources :likes, :only => [:create]
  end
  resources :comments, :only => [:index, :create]

  resources :event, :except => [:show] do
    get 'show/:event_type', :on => :member, :action => :show, :as => :show
  end

  #resources :like

  root :to => 'categories#index'

  get '/catlist', :to => 'categories#catlist', :as => :catlist
end
