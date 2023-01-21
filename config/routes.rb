Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:index, :edit, :create, :show, :destroy, :update]
  resources :users, only: [:index, :show, :edit, :update]
  get '/homes/about' => 'homes#about' , as: 'about'
  end
