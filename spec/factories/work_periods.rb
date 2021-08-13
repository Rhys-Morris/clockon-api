FactoryBot.define do
  factory :work_period do
    title { "A task I was working on" }
    start_time { "1628843877422" }
    end_time { "1628843890491" }
    invoiced { false }
    project factory: :project
  end
end
