Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"

  resources :users, only: [:index, :edit, :show, :create, :update]

  resources :books, only:[:index, :show, :edit, :destroy]
  post 'books' => 'books#create'

  get 'homes/about' => 'homes#about', as: 'about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
