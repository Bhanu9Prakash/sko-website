Rails.application.routes.draw do
  resources :kids
  resources :houses
  resources :reviews
  resources :albums
  resources :discussions do
    resources :comments, module: :discussions
  end
  resources :projects
  resources :posts do
    resources :comments, module: :posts
    resources :likes
  end
  resources :comments do
    resources :comments, module: :comments
  end
  
  resources :mentions, only: [:index]
  resources :users, only: [:index, :edit, :update]
  devise_for :users, controllers: {
        sessions: 'users/sessions'
  }
  root to: 'home#index'
  get 'home/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
