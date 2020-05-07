Rails.application.routes.draw do
  
  resources :clients do
    resources :investments, only: [:show, :index]
  end
 
  resources :users, only: [:new, :create]
  
  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'
  
  get 'welcome', to: 'sessions#welcome'

  post '/logout', to: 'sessions#destroy'

  get 'authorized', to: 'sessions#page_requires_login'

  resources :investments

  get '/', to: 'main#home'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


