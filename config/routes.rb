Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: 'pages#home'

  resources :tickets, only: %i[edit update show destroy] do
    resources :trades, only: %i[index show new create]
  end

  resources :events, only: %i[index show destroy new create] do
    resources :tickets, only: %i[new create]
  end

  resources :trades, only: %i[index show]
end
