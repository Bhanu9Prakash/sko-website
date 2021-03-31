Rails.application.routes.draw do
  resources :projects
  resources :posts do
    resources :comments, module: :posts
  end
  resources :comments do
    resources :comments, module: :comments
  end
  devise_for :users
  root to: 'home#index' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
