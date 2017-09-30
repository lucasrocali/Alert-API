FactoryGirl.define do
  factory :user do
  	api_user_id 1
    email { Faker::Internet.email }
    password "password"
    after(:create) do |user|
      user.user_info ||= FactoryGirl.build(:user_info, :user => user)
    end
  end
end