Rails.application.routes.draw do
  devise_for :users
  root "toppages#index"
  resources :toppages, only: [:index]
  resources :users, only: [:edeit, :update, :show]
  resources :posts do
    collection do
      get 'user_posts'
      get 'category_posts'
      get 'maker_posts'
    end
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :categories, only: [:index, :show]
  resources :makers, only: [:index, :show]
end
