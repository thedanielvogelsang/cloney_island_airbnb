Rails.application.routes.draw do
  root 'homepage#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/search', to: 'search#index'

  resources :users, only: [:new, :create]
  resources :listings, only: [:index, :show]

  namespace :user do
    resources :dashboard, only: [:index, :show]
  end
end
