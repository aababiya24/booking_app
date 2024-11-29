Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'dashboards#index'

  # Ensure to generate RESTful routes for bookings
  resources :bookings, only: [:new, :create, :index, :show]

  # Custom dashboards
  get 'client_dashboard', to: 'dashboards#client'
  get 'photographer_dashboard', to: 'dashboards#photographer'
end


