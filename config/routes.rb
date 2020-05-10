Rails.application.routes.draw do
  devise_for :users
  root "toppages#index"
  resources :toppages, only: [:index]
  resources :users, only: [:edeit, :update, :show]
  resources :posts, only: [:index, :new, :create, :destroy, :update, :edit]
  resources :products, only: [:show]
  resources :categories, only: [:index, :show]
  resources :makers, only: [:index, :show]
end
