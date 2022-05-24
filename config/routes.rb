Rails.application.routes.draw do
  devise_for :users
  root to: 'superpowers#index'

  resources :superpowers do
    resources :bookings, only: [:new, :create]
    end

  resources :superpowers do
    resources :reviews, only: [ :new, :create ]
  end
  resources :bookings, only: :destroy

  get 'reservation/validate', to: 'superpowers#reservation'

  resources :reviews, only: :destroy

end
