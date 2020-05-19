Rails.application.routes.draw do
  
 resources :users, only: [:show,:new, :create ] 
  
  resources :clients do
      resources :investments, only: [:index,:new,:create,:show, :edit]
    end
  

  
  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'
  
  get 'welcome', to: 'sessions#welcome'

  post '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#create'

  get 'authorized', to: 'sessions#page_requires_login'

  resources :investments, only: [:index,:show]
 
  root to: 'main#home'
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


