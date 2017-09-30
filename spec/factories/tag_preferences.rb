FactoryGirl.define do
  factory :tag_preference do
    user_id { Faker::Number.number(1) }
    tag_id { Faker::Number.number(1) }
  end
end
