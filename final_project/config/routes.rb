Rails.application.routes.draw do

  resources :posts

  get 'session/login'
  post 'session/create'
  get 'session/logout'

  resources :users
  root to: 'posts#index'

  get 'happy/input'
  get 'happy/output'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
