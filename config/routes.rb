Rails.application.routes.draw do
  root 'tools#index'
  devise_for :users

  resources :users, only: [:index, :destroy]
  resources :categories, only: [:index, :show]
  resources :tools, only: [:index, :show, :new, :create, :destroy] do
    resources :reviews, only: [:new, :create, :destroy]
  end
  resources :reviews, only: [:new, :create, :show, :index, :destroy] do
    resources :comments, only: [:new, :create]
  end
end
