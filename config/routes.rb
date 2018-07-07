Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :home, only: :index
  resources :questions, only: :index
  resource :user, only: :show
end
