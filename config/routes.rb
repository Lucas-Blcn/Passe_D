Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users do
    resources :products, except: [:show]
    resources :bookings
  end
  resources :products, only: [:show,]
end
