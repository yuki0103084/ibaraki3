Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "home#index"
  resources :users
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  get '/article/category', to: "articles#category"
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end 
  resources :articles do
  resources :comments, only: [:create, :destroy] 
  end
end