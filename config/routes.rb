Rails.application.routes.draw do

  # Defines the root path route ("/")
  # root "openings#index"

  resources :openings
  resources :studies

  post "/users", controller: "users", action: "create"
  post "/sessions", controller: "sessions", action: "create"
end
