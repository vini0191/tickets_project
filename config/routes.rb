Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/edit'
  get 'reviews/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root to: 'pages#home'
  get 'pages/user_profile/:id', to: 'pages#user_profile', as: 'user_profile'

  resources :tickets, only: %i[edit update show destroy] do
    resources :trades, only: %i[index show new create]
  end

  resources :events, only: %i[index show destroy new create] do
    resources :tickets, only: %i[new create]
  end

  resources :trades, only: %i[index show] do
    resources :reviews, only: %i[new create]
  end

  resources :review, only: %i[edit update]

end
