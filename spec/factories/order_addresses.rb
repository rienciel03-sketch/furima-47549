FactoryBot.define do
  factory :order_address do
    postcode      { '123-4567' }
    prefecture_id { 2 }
    municipality  { '横浜市' }
    address       { '青山1-1' }
    building_name { '東京ビル' }
    phone_number  { '09012345678' }
    token         { "tok_abcdefghijk00000000000000000" }
  end
end
