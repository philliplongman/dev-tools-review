Rails.application.routes.draw do
  root 'tools#index'
  devise_for :users

  resources :tools, only: [:index, :show, :new, :create]

end
