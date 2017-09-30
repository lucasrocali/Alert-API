FactoryGirl.define do
  factory :category_preference do
    user_id { Faker::Number.number(1) }
    category_id { Faker::Number.number(1) }
  end
end
