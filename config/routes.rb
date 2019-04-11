Rails.application.routes.draw do
  resources :posts
  resources :users
  get '/profile', to: 'users#index'
  
  root 'pages#welcome'

  get '/profile', to: 'users#index'
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
