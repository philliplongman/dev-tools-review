Rails.application.routes.draw do
  root 'tools#index'
  devise_for :users

  resources :users, except: [:new, :create]
  resources :categories, only: [:index, :show]
  resources :tools do
    resources :reviews, except: [:show, :index]
  end
  resources :reviews, only: [:new, :create, :show, :index] do
    resources :comments, except: [:show, :index]
    resources :votes, only: [:create, :update]
  end
end
