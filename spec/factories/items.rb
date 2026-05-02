FactoryBot.define do
  factory :item do
    name   {'テスト商品'}
    introduction {Faker::Lorem.sentence}
    category_id {2}
    condition_id {2}
    shipping_cost_id {2}
    prefecture_id {2}
    shipping_time_id {2}
    price {400}

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
