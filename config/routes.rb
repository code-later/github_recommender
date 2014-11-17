Rails.application.routes.draw do
  root 'users#new'

  resources :users do
    resources :recommendations
  end

  resource :sessions, only: [:create, :destroy]

  get '/auth/:provider/callback', to: 'sessions#create'
end
