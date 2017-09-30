FactoryGirl.define do
  factory :api_user do
  	api_name { Faker::Name.name  }
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
  end
end