FactoryGirl.define do
  factory :category do
  	api_user_id 1
    name { Faker::Name.first_name }
    image_url { Faker::Avatar.image("my-own-slug", "50x50") }
    category nil
  end
end
