# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'landing#home'
  get '/users/discover', to: 'users#discover'
  get '/users/dashboard', to: 'users#show'

  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login'

  resources :users, except: [:new, :show]
  resources :parties

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  # get '/admin', to: 'admins#dashboard'
  get '/users/movies', to: 'users#movies'
  get '/users/movies/:movie_id', to: 'users#movie_details'
  get '/users/movies/:movie_id/viewing-party/new', to: 'parties#new'
  post '/users/viewing-party/dashboard', to: 'parties#create'

  get '/users/viewing-party/dashboard', to: 'parties#dashboard'
end
