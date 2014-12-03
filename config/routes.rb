Rails.application.routes.draw do
  root 'recommendations#index'

  resources :users, only: [:new]
  resources :recommendations, only: [:index]

  resource :sessions, only: [:create, :destroy]

  resources :import_jobs, only: [:show] do
    member do
      get :job_status
    end
  end

  get '/auth/:provider/callback', to: 'sessions#create'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
