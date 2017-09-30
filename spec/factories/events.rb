FactoryGirl.define do
  factory :event do
    location_id { Faker::Number.number(1) }
    category_id { Faker::Number.number(1) }
    importance 1
    comment "MyString"
  end
end
