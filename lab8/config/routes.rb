Rails.application.routes.draw do
  get 'armstrong/input'

  get 'armstrong/output'

  root to: 'armstrong#input'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
