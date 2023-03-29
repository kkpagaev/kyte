Rails.application.routes.draw do
  resources :boilerplates
  resources :repositories
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
