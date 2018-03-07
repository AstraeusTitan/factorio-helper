Rails.application.routes.draw do
  resources :recipes
  root 'static_pages#welcome'

  get '/welcome', to: 'static_pages#welcome'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/account', to: 'users#show'
  get '/account/edit', to: 'users#edit'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
end
