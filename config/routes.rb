Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'pages#home'
  resources :tickets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events, only: %i[index show destroy new create] do
    resources :tickets, only: %i[show]
  end
end
