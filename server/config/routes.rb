Rails.application.routes.draw do
  resources :users
  root to: 'users#index'

  namespace :api do
    post '/existence', to: 'existence#update'
    post '/umbrella',  to: 'umbrella#update'
    post '/weather',   to: 'weather#update'
  end
end
