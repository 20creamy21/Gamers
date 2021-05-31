Rails.application.routes.draw do

  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get '/about' => 'homes#about'

  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
  end

  resources :comments, only: [:new, :create, :destroy]

  get 'ranks/index'

  resources :relationships, only: [:create, :destroy]

  resources :users, only: [:show]
  get 'follow_index' => 'users#follow_index'
  get 'follower_index' => 'users#follower_index'

end