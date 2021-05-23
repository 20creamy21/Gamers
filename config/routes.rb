Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get '/about' => 'homes#about'

  resources :games, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
  end

  resources :comments, only: [:new, :create, :destroy]

  get 'ranks/index'

end