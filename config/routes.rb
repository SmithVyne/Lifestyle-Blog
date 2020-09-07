Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resources :articles, except: [:edit, :update, :destroy]
  resources :votes, only: [:create]
  resources :categories, only: [:new, :show, :create]
  resources :sessions, only: [:new, :create, :destroy]

  root 'sessions#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  get 'articles/:id/vote' => 'votes#create'

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
end
