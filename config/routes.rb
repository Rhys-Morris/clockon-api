Rails.application.routes.draw do
  # LOGIN & AUTH
  post "/register", to: "users#create"
  post "/login", to: "users#login"
  get "/user", to: "users#user_details"
  delete "/user", to: "users#destroy"
  # DASH
  get "/dash/", to: "users#dash"
  get "/dash/:period", to: "users#dash"
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
  post "/tasks/:project_id", to: "tasks#create"
  put "/tasks/:project_id/:id", to: "tasks#update"
  delete "/tasks/:project_id/:id", to: "tasks#destroy"
  # EXPENSES
  post "/expenses/:project_id", to: "expenses#create"
  put "/expenses/:project_id/:id", to: "expenses#update"
  delete "/expenses/:project_id/:id", to: "expenses#destroy"
  delete "/receipt/:project_id/:id", to: "expenses#purge_receipt"
  # WORK PERIODS
  get "/work", to: "work_periods#index"
  get "/work/:project_id/invoice", to: "work_periods#invoice"
  post "/work/:project_id", to: "work_periods#create"
  delete "/work/:project_id/:id", to: "work_periods#destroy"
end
