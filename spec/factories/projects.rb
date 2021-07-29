FactoryBot.define do
  factory :project do
    color { "#000000" }
    name { "Test Project" }
    client factory: :client
    user factory: :user
    due_date { "2022-07-30" }
    billable { true }
    active { true }
    hours { 1.5 }
    billable_rate { 40.0 }
  end
end
