FactoryGirl.define do
  factory :category do
    name { Faker::Name.first_name }
    image_url { Faker::Avatar.image("my-own-slug", "50x50") }
    category nil
  end
end
