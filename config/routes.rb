Rails.application.routes.draw do
  get 'user/portfolio'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#home'
  get 'show', to: 'stock#show'
  get 'portfolio', to: 'user#portfolio'

  get 'search', to: 'stock#search'
  post 'create_stock', to: 'stock#create'
  delete 'destroy_stock', to: 'stock#destroy'
  get 'users_friends', to: 'user#friends'
  delete 'destroy_friends', to: 'user#destroy'
  get 'search_friend', to: 'user#search'
  post 'follow_friend', to: 'user#create'

end
