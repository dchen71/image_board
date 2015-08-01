Rails.application.routes.draw do
  root 'images#index'
  resources :images, except: [:edit, :update, :destroy]
  resources :users, only: [:new, :create, :show]

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', via: 'delete'
end
