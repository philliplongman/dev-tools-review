Rails.application.routes.draw do
  root 'tools#index'
  devise_for :users

  resources :tools, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end
end
