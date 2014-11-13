Rails.application.routes.draw do
  root 'users#new'

  resources :users do
    resources :recommendations
  end
end
