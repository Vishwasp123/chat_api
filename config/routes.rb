Rails.application.routes.draw do
  namespace :api do 
    resources :users
    resources :chats
    resources :messages
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
