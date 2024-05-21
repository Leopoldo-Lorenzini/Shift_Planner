Rails.application.routes.draw do

  root 'home#index'
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, only: [:new, :create]
  get 'perfil', to: 'home#index'
  get 'viaje', to: 'home#viajes'
  get 'global', to: 'home#index'

  resources :itineraries, only: [:new, :create]


end
