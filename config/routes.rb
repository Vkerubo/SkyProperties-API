Rails.application.routes.draw do

  resources :users, except: [:show]
  get '/me', to: 'users#show'
  resources :favorites, only: [:index, :create, :destroy]
  resources :favorites, except: [:update]
  resources :properties, only: [:index, :create, :show, :update, :destroy]
  resources :buyers
  resources :sellers, except: [:index]

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"


end
