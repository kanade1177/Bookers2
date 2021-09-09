Rails.application.routes.draw do
  get 'chats/show'
  devise_for :users
  root to: 'homes#top'
  get "home/about" => "homes#about", as: "about"

  get "search" => "searches#search"
  
  get "chat/:id" => "chats#show", as: "chat"

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
  end
  
  resources :chats, only: [:create]
  
  resources :groups, except: [:destroy]
  
end


