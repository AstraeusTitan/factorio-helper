Rails.application.routes.draw do
  root 'static_pages#welcome'
  # Static pages
  get '/welcome', to: 'static_pages#welcome'
  get '/details', to: 'static_pages#details'
  # Users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/account', to: 'users#show'
  get '/account/edit', to: 'users#edit'
  # Sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
  # Recipes
  get '/browse', to: 'recipes#index'
  post '/browse', to: 'recipes#index'
  get '/recipe/:id', to: 'recipes#show', as: :recipe
  get '/upload', to: 'recipes#upload'
  post '/upload', to: 'recipes#upload'
end
