Rails.application.routes.draw do
  
  get 'pdfs/index'
  get 'pdfs/new'
  get 'pdfs/create'
  get 'pdfs/destroy'
  get 'files/index'
  get 'files/new'
  get 'files/create'
  get 'files/destroy'
  resources :users, only: [:new, :create]
  
  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'
  
  get 'welcome', to: 'sessions#welcome'

  get 'authorized', to: 'sessions#page_requires_login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
