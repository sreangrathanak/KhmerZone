Rails.application.routes.draw do
  root "static_pages#home"

  get "help"=>"static_pages#help", as: :help
  get "about"=>"static_pages#about", as: :about
  get "contact"=>"static_pages#contact", as: :contact

  resources :sessions, only: [:new, :create, :destroy]
  get "signin" => "sessions#new", as: :signin
  get "signout" => "sessions#destroy", as: :signout
  get "signup" => "users#new", as: :signup
  get "stores" => "users#index", as: :stores
  resources :users , :path => '' do
    member do
      get :following, :followers
    end
    resources :products do
      resources :product_comments
      resources :product_likes,       only: [:create, :destroy]
      resources :product_rates
    end
    resources :relationships,       only: [:create, :destroy]
    resources :messages
    resources :recivers    
    resources :notifications do
      get "notifications/update_ischecks"    
    end
  end
end
