Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  resources :articles do
  resources :comments, only: [:create, :destroy]  
  
end
end