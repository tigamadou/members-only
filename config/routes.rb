Rails.application.routes.draw do
  root 'posts#index'
  get 'sign_in', action:'new', controller: 'sessions'
  post 'sign_in', action:'create', controller:'sessions'
  delete 'sign_out', action: 'destroy', controller: 'sessions'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  resources :user
  # Post Routes

  resources :posts
 
  
  post 'posts', to: 'posts#create'
end
