Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  #new root for the welcome page/landing page
  get '/welcome', to: 'pages#welcome'

  resources :products, except: [:index]

  resources :products, only: [:show] do
    resources :bookings
  end
end
