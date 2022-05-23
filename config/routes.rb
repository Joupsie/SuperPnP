Rails.application.routes.draw do
  devise_for :users
  root to: 'superpowers#index'

  resources :superpowers do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: :destroy
end
