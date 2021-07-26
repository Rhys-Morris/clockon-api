FactoryBot.define do
  factory :expense do
    name { "New Expense" }
    cost { 20.5 }
    date { "2021-07-26" }
    project factory: :project
  end
end
