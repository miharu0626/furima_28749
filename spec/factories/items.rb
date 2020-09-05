FactoryBot.define do
  factory :item do
    name { 'あいうえお' }
    detail { 'あいうえお' }
    price { 123_456 }
    category_id { Faker::Number.between(from: 1, to: 10) }
    item_status_id { Faker::Number.between(from: 1, to: 6) }
    shipping_fee_id { Faker::Number.between(from: 1, to: 2) }
    shipping_location_id { Faker::Number.between(from: 1, to: 47) }
    shipping_date_id { Faker::Number.between(from: 1, to: 3) }
    association :user
  end
end
