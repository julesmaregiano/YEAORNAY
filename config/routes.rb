Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users
  root to: 'pages#home'
  resources :polls, only: [ :new, :create, :destroy], shallow: true do
    resources :answers, only: [ :new, :create]
    resources :targets, only: [ :new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
