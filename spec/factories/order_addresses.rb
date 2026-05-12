FactoryBot.define do
  factory :order_address do
    postcode       {'123-4567'}
    prefecture_id  {2}
    municipality   {Faker::Lorem.word}
    address        {Faker::Lorem.word}
    building_name  {Faker::Lorem.word}
    phone_number   {Faker::Number.number(digits: 10)}
    user_id        {1}
    item_id        {1}
    token          {'tok_abcdefghijk00000000000000000'}
  end
end
