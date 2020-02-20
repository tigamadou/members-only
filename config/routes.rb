Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'

  # Post Routes
  get 'posts', to: 'posts#index'
  get 'posts/new', to: 'posts#new'
  post 'posts/create', to: 'posts#create'
end
