Rails.application.routes.draw do
  root 'posts#index'
  get 'sign_in', action:'new', controller: 'sessions'
  post 'sign_in', action:'create', controller:'sessions'
  delete 'sign_out', action: 'destroy', controller: 'sessions'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  resources :user
 
  post 'posts', to: 'posts#create'
  get 'posts/new', to: 'posts#new'
  get 'posts', to: 'posts#index'

end
