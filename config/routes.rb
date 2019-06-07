Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :projects
      resources :instruments
      resources :tracks
      resources :instrument_presets
    end
  end

  post 'auth/request', to:'authorization#get_authorization'
end
