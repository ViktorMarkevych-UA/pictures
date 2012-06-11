Analitics::Application.routes.draw do

  devise_for :users

  resources :categories

  resources :pictures

  resources :comment

  resources :event

  #resources :like

  root :to => 'categories#index'

  match "/catlist" => "categories#catlist"

  #match "event/show/:id" => "event#show"

  get '/like/:id', :to => 'pictures#like', :as => :like
  get '/picts', :to => 'pictures#all_img', :as => :all_img
  get '/comms', :to => 'comment#all_comm', :as => :all_comm

end
