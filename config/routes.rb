Rails.application.routes.draw do
  root 'tools#index'
  devise_for :users

  resources :categories, only: [:index, :show]
  resources :tools, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create]
  end
end
