Rails.application.routes.draw do

  put '/api/v1/users/find', to: 'api/v1/users#findUser'
  post '/login', to: 'application#log_in'
  put '/api/v1/tracks/get_tracks', to: 'api/v1/tracks#getTracks'

  namespace :api do
    namespace :v1 do
      resources :users
      resources :projects
      resources :instruments
      resources :tracks
      resources :instrument_presets
      resources :scenes
    end
  end


  # get 'auth/:provider/callback', to: 'sessions#googleAuth'
  # get 'auth/failure', to: redirect('/')
end
