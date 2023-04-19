require 'sidekiq/web'

Rails.application.routes.draw do
  resources :users, path: '/admin/users'
  resources :boilerplates
  resources :repositories
  resources :projects

  mount Sidekiq::Web => '/sidekiq'

  get 'project_view', to: 'projects#project_view', as: :project_view

  get 'repository_view', to: 'projects#repository_view', as: :repository_view
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"

  devise_for :users do
  end
end
