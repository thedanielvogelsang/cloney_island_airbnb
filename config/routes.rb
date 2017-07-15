Rails.application.routes.draw do
  root 'homepage#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/search', to: 'search#index'

  resources :listings, only: [:index, :show]

  resources :users, only: [:new, :create] do
    resources :dashboard, only: [:index]
  end

  namespace :host do
    resources :listings, only: [:new, :create]
    resources :dashboard, only: [:index]
  end
end
