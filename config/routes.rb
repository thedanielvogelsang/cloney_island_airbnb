Rails.application.routes.draw do
  root 'homepage#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/search', to: 'search#index'

  resources :users, only: [:new, :create]
  resources :listings, only: [:index]

  namespace :users do
    resources :dashboard, only: [:index]
  end

end
