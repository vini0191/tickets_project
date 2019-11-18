Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'pages#home'

  resources :events, only: %i[index show destroy new create] do
    resources :tickets, only: %i[show]
  end

end
