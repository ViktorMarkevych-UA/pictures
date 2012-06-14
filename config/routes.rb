Analitics::Application.routes.draw do

  devise_for :users, :controllers => { :sessions => "sessions" }

  resources :categories

  resources :pictures

  resources :comment

  resources :event, :except => [:show] do
    get 'show/:event_type', :on => :member, :action => :show, :as => :show
  end

  #resources :like

  root :to => 'categories#index'

  match "/catlist" => "categories#catlist"

  get '/like/:id', :to => 'pictures#like', :as => :like
  get '/picts', :to => 'pictures#all_img', :as => :all_img
  get '/comms', :to => 'comment#all_comm', :as => :all_comm
end
