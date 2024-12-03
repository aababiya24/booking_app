Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'dashboards#index'

  # Ensures to generate RESTful routes for bookings
  resources :bookings, only: [:new, :create, :index, :edit, :update, :destroy]

  # Custom dashboards
  get 'client_dashboard', to: 'dashboards#client'
  get 'photographer_dashboard', to: 'dashboards#photographer'
end


