FactoryGirl.define do
  factory :location do
    user_id { Random.new.rand(1..19) }
    lat { -Random.new.rand(2270000..2290000)/100000.0 }
    lon { -Random.new.rand(4330000..4350000)/100000.0 }
  end
end
