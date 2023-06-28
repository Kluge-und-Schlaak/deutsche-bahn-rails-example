Rails.application.routes.draw do
  root 'home#index'
  # get '/tasks', to: 'tasks#index'

  # get '/tasks/:id', to: 'tasks#show'

  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
