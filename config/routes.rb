Rails.application.routes.draw do
  root 'users#new'

  resources :users do
    resources :recommendations
  end

  get '/auth/:provider/callback', to: 'sessions#create'
end
