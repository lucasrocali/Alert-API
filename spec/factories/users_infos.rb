FactoryGirl.define do
  factory :user_info do
    name { Faker::Name.name }
    birthday { Faker::Date.birthday(18, 65) }
    address { Faker::Address.street_address }
    after(:build) do |user_info|
      user_info.user ||= FactoryGirl.build(:user, :user_info => user_info)
    end
  end
end