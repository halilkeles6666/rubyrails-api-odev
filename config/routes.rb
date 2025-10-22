Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "authors/index"
      get "authors/show"
      get "genres/index"
      get "genres/show"
      get "reviews/index"
      get "reviews/show"
      get "reviews/create"
      get "users/index"
      get "users/show"
      get "users/create"
      get "hello", to: "greetings#show"
      resources :books, only: [ :index, :show, :create ]
      resources :authors, only: [ :index, :show ]
      resources :genres, only: [ :index, :show ]
      resources :users, only: [ :index, :show, :create ]
      resources :reviews, only: [ :index, :show, :create ]
      resources :authors, only: [ :index, :show ]
      resources :genres, only: [ :index, :show ]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
