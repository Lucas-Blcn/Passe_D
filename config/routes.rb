Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :products, except: [:index]

  resources :products, only: [:show] do
    resources :bookings
  end
end
