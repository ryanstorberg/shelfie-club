Rails.application.routes.draw do
  root 'general#home'
  resources :users
  resources :sessions,      only: [:new, :create, :destroy]
  resources :books
  resources :readerships,   only: [:create, :destroy]
  resources :clubs
  resources :relationships, only: [:create, :destroy]
  resources :discussions
  resources :posts
  resources :replies
end
