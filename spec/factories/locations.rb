FactoryGirl.define do
  factory :location do
    user_id { Faker::Number.number(1) }
    lat { Faker::Address.latitude }
    lon { Faker::Address.longitude }
  end
end
