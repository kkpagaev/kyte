Rails.application.routes.draw do
  devise_for :users

  resources :users
  resources :boilerplates
  resources :repositories
  resources :projects

  get 'project_view', to: 'projects#project_view', as: 'project_view'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
end
