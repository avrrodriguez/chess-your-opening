Rails.application.routes.draw do

  # Defines the root path route ("/")
  # root "openings#index"

  resources :openings

  post "/users", controller: "users", action: "create"
end
