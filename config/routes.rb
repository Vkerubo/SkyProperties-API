Rails.application.routes.draw do
  resources :users
  resources :favorites
  resources :properties
  resources :buyers
  resources :sellers, except: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
