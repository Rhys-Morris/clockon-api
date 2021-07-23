Rails.application.routes.draw do
  post "/register", to: "users#create"
  post "/login", to: "users#login"
  get "/clients", to: "clients#index"
  post "/clients", to: "clients#create"
  put "/clients/:id", to: "clients#update"
  delete "/clients/:id", to: "clients#destroy"
end
