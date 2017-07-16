Rails.application.routes.draw do
  root 'homepage#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]

  get '/search', to: 'search#index'

  resources :listings, only: [:index, :show]

  resources :users, only: [:new, :create] do
    resources :dashboard, only: [:index]
  end

  namespace :host do
    resources :listings, only: [:new, :create]
  end
end
