Rails.application.routes.draw do
  
  get 'clients/new'
  get 'clients/index'
  get 'clients/show'
  resources :users, only: [:new, :create]
  
  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'
  
  get 'welcome', to: 'sessions#welcome'

  post '/logout', to: 'sessions#destroy'

  get 'authorized', to: 'sessions#page_requires_login'

  resources :investments, only: [:show,:new, :create, :edit, :index, :destroy]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


