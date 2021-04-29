Rails.application.routes.draw do
  root to: 'articles#index'

  devise_for :users

  resources :articles do
    resource :like,      only: [:show, :create, :destroy]
    resources :comments, only: [:create]
  end

  resources :accounts, only: [:show] do
    resources :relationships, only: [:create, :destroy]
  end
  
  resource :timeline, only: [:show]
  resource :profile,  only: [:show, :new, :create, :edit, :update]

  # Stripeのルーティング
  resources :payments

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
