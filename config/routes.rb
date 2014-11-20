Rails.application.routes.draw do
  root 'recommendations#index'

  resources :users, only: [:new]
  resources :recommendations, only: [:index]

  resource :sessions, only: [:create, :destroy]

  get '/auth/:provider/callback', to: 'sessions#create'
end
