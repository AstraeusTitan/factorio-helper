Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#welcome'

  get '/welcome', to: 'static_pages#welcome'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/account', to: 'users#account'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
end
