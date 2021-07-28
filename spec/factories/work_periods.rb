FactoryBot.define do
  factory :work_period do
    title { "A task I was working on" }
    start_time { "2021-07-28 12:50:49" }
    end_time { "2021-07-28 12:50:56" }
    project factory: :project
  end
end
