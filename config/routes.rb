Rails.application.routes.draw do
  get 'work_periods/index'
  get 'work_periods/create'
  get 'work_periods/update'
  get 'work_periods/destroy'
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
  post "/tasks/:project_id", to: "tasks#create"
  put "/tasks/:project_id/:id", to: "tasks#update"
  delete "/tasks/:project_id/:id", to: "tasks#destroy"
  # EXPENSES
  post "/expenses/:project_id", to: "expenses#create"
  put "/expenses/:project_id/:id", to: "expenses#update"
  delete "/expenses/:project_id/:id", to: "expenses#destroy"
  # WORK PERIODS
  get "/work", to: "work_periods#index"
  post "/work/:project_id", to: "work_periods#create"
  put "/work//:project_id/:id", to: "work_periods#update"
  delete "/work/:project_id/:id", to: "work_periods#destroy"
end
