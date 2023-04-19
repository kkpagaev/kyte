require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users

  resources :users
  resources :boilerplates
  resources :repositories
  resources :projects

  mount Sidekiq::Web => '/sidekiq'

  get 'project_view', to: 'projects#project_view', as: 'project_view'

  get 'repository_view', to: 'projects#repository_view', as: 'repository_view'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
end
