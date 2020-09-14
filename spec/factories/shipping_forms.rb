FactoryBot.define do
  factory :shipping_form do
    post_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { 'あいうえお' }
    add_num { 'あいうえお' }
    phone_num { '08011111111' }
    token { 'xxxxxxxxxxxxxx' }
  end
end
