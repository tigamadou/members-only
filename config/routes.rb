Rails.application.routes.draw do
  root 'posts#index'
  get 'sign_in', action:'new', controller: 'sessions'
  post 'sign_in', action:'create', controller:'sessions'
  delete 'sign_out', action: 'destroy', controller: 'sessions'

  # Post Routes

  resources :posts
 
  
  post 'posts', to: 'posts#create'
end
