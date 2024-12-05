Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: { registrations: 'users/registrations'}
  # root 'dashboards#index'

  # Custom dashboards
  get 'client_dashboard', to: 'dashboards#client'
  get 'photographer_dashboard', to: 'dashboards#photographer'

  #routes for bookings
  resources :bookings, only: [:new, :create, :index, :edit, :update, :destroy]

end


