Rails.application.routes.draw do
  root 'images#index'
  resources :images, except: [:edit, :update, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :comments, only: [:create]
  resources :tags, only: [:create, :show]

  get '/search' => 'tags#search'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', via: 'delete'
end
