Rails.application.routes.draw do
  root 'images#index'
  resources :images
  resources :users
end
