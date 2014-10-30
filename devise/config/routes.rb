Rails.application.routes.draw do
  resources :secrets

  devise_for :users

  root to: 'secrets#index'
end
