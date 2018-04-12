Rails.application.routes.draw do
  get 'session/create'
  
  post 'session/login'
  
  get 'session/login', to: 'session#create'
  
  get 'session/destroy'
  
  post 'users/create'
  
  resources :users
  get 'calculator/input'

  get 'calculator/output'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'session#create'
end
