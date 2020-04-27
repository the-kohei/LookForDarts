Rails.application.routes.draw do
  devise_for :users
  root "toppages#index"
  resources :users, only: [:edeit, :update]
  resources :posts, only: [:index, :new, :create, :destroy, :update, :edit]
  resources :products, only: [:show]
end
