Rails.application.routes.draw do
  root "static_pages#home"

  get "help"=>"static_pages#help", as: :help
  get "about"=>"static_pages#about", as: :about
  get "contact"=>"static_pages#contact", as: :contact

  resources :sessions, only: [:new, :create, :destroy]
  get "signin" => "sessions#new", as: :signin
  get "signout" => "sessions#destroy", as: :signout

  resources :users
  get "signup" => "users#new", as: :signup
end
