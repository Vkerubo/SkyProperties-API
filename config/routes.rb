Rails.application.routes.draw do
  resources :users
  resources :favorites, only: [:index, :create, :destroy]
  resources :properties, only: [:index, :create, :show, :update, :destroy]
  resources :buyers
  resources :sellers, except: [:index]

  get "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
