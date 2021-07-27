FactoryBot.define do
  factory :task do
    title { "New Task" }
    due_date { "2021-12-25" }
    estimated_hours { 10.0 }
    completed { true }
    project factory: :project
  end
end
