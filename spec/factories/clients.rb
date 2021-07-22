FactoryBot.define do
  factory :client do
    name { "Test Client" }
    email { "testclient@test.com" }
    contact { "George Cooper" }
    active { true }
    user factory: :user
  end
end
