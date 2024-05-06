Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: 'about'

  resources :users, only: [:index, :edit, :show, :create, :update]

  resources :books, only:[:index, :show, :edit, :update, :destroy]
  post 'books' => 'books#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
