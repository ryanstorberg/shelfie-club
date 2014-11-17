Rails.application.routes.draw do
  root 'general#home'
  resources :users
  resources :books
  resources :read_books, only: [:create, :destroy]
  resources :sessions,   only: [:new, :create, :destroy]
end
