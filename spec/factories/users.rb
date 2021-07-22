# Define the user class

FactoryBot.define do
    factory :user do
      name { "John" }
      email { "john@test.com" }
      password {"password"}
    end
  end