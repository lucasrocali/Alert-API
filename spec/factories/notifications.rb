FactoryGirl.define do
  factory :notification do
    location { Faker::Number.number(1)  }
    event { Faker::Number.number(1)  }
  end
end
