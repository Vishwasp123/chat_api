Rails.application.routes.draw do

  namespace :api do 
    resources :users
    resources :chats
    resources :messages
  end

  namespace :has_many_through do 
    resources :appointments
    resources :patients
    resources :physicians
  end

  namespace :polymorphism do 
    resources :events
    resources :forums
    resources :posts
  end

  resources :books 
  resources :authors



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
