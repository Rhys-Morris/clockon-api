Rails.application.routes.draw do
  # LOGIN & AUTH
  post "/register", to: "users#create"
  post "/login", to: "users#login"
  # CLIENTS
  get "/clients", to: "clients#index"
  post "/clients", to: "clients#create"
  put "/clients/:id", to: "clients#update"
  delete "/clients/:id", to: "clients#destroy"
  # PROJECTS
  get "/projects", to: "projects#index"
  post "/projects", to: "projects#create"
  put "/projects/:id", to: "projects#update"
  delete "/projects/:id", to: "projects#destroy"
end
