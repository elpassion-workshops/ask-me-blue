Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :home, only: :index
  resources :questions, only: [:index, :create, :new]
  resource :user, only: :show
end
