Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root 'welcome#index'
  root 'groups#index'

  resources :groups do

    member do
      post :join
      post :quit
    end

    resources :posts 
  end

  namespace :account do
    resources :groups
    resources :posts
  end

end
