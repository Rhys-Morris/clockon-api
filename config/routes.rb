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
  get "/projects/:id", to: "projects#show"
  put "/projects/:id", to: "projects#update"
  delete "/projects/:id", to: "projects#destroy"
  # TASKS
  get "/tasks/:project_id", to: "tasks#index"
  post "/tasks/:project_id", to: "tasks#create"
  put "/tasks/:id", to: "tasks#update"
  delete "/tasks/:project_id/:id", to: "tasks#destroy"
    # EXPENSES
    get "/expenses/:project_id", to: "expenses#index"
    post "/expenses/:project_id", to: "expenses#create"
    put "/expenses/:id", to: "expenses#update"
    delete "/expenses/:project_id/:id", to: "expenses#destroy"
end
