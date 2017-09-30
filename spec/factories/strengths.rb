FactoryGirl.define do
  factory :strength do
    event_id { Faker::Number.number(1) }
    user_id { Faker::Number.number(1) }
    up_down { Faker::Number.number(1) }
  end
end
