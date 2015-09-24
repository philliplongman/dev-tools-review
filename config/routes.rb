Rails.application.routes.draw do
  root 'tools#index'
  devise_for :users

  resources :tools, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:new, :create, :show] do
    resources :comments, only: [:new, :create]
  end
end
