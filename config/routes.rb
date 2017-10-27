Rails.application.routes.draw do

  # USERS MANAGEMENT
  devise_for :users
  post '/users', to: 'users#create'
  get '/users/expired', to: 'users#list_expired'

  resources :users

  # FILTERS
  resources :filters
  # TELESCOPES
  resources :telescopes
  # EYEPIECES
  resources :eyepieces
  # BINOCULARS
  resources :binoculars

  # CELESTIAL BODIES
  resources :celestial_bodies

  # OBSERVATIVE SESSIONS
  resources :observative_sessions

  root to: 'application#index'

end
