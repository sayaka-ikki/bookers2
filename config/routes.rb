Rails.application.routes.draw do

  get 'books/index'
  get 'books/show'
  get 'books/edit'

  resources :users, only: [:index, :edit]
  get '/users/show', to: 'users#show'

  resources :books, only:[:new, :index, :show, :edit]
  root to: "homes#top"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
