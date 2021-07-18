Rails.application.routes.draw do
  get 'users/login'
  post "/register", to: "users#create"
  post "/login", to: "users#login"
end
