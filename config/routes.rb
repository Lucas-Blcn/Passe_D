Rails.application.routes.draw do
  devise_for :users
  root to: "pages#welcome"
  #new root for the welcome page/landing page
  #get '/welcome', to: 'pages#welcome'
  get '/pages', to: 'pages#home', as: :home

  resources :products

  resources :products, only: [:show] do
    resources :bookings
  end
end
