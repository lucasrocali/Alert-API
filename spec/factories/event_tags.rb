FactoryGirl.define do
  factory :event_tag do
    event_id { Faker::Number.number(1) }
    tag_id { Faker::Number.number(1) }
  end
end
