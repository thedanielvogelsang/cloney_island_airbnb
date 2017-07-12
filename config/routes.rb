Rails.application.routes.draw do
  root 'sessions#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/search', to: 'search#index'

  resources :users, only: [:new, :create]

  namespace :users do
    resources :dashboard, only: [:index]
  end

end
