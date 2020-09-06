FactoryBot.define do
  factory :item do
    name { 'あいうえお' }
    detail { 'あいうえお' }
    price { 123456 }
    category_id { Faker::Number.between(from: 2, to: 11) }
    item_status_id { Faker::Number.between(from: 2, to: 7) }
    shipping_fee_id { Faker::Number.between(from: 2, to: 3) }
    shipping_location_id { Faker::Number.between(from: 2, to: 48) }
    shipping_date_id { Faker::Number.between(from: 2, to: 4) }
    association :user
  end
end
