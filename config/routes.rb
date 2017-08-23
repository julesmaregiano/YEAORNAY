Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :polls, only: [:new, :index, :create] do
    resources :targets, only: [:new, :create]
  end
  resources :answers, only: [:new, :create]

  namespace :my do
    resources :polls, only: [:index, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
