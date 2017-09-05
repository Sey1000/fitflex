Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }
  root to: 'pages#home'

  post 'courses/search_courses', to: 'courses#update_index'
  get 'about',       to: 'pages#about'
  resources :courses do
    resources :reviews, only: [:new, :create]
    resources :payments, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :create, :destroy] do
    # resources :payments, only: [:new, :create]
  end
  resources :users, only: [:show, :edit, :update]
  resources :studios

  # Attachinary route
  mount Attachinary::Engine => "/attachinary"
end
