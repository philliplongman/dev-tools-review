Rails.application.routes.draw do
  root 'tools#index'
  devise_for :users

  resources :users, only: [:index, :destroy]
  resources :categories, only: [:index, :show]
  resources :tools do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :reviews, only: [:new, :create, :show, :index] do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end
end
