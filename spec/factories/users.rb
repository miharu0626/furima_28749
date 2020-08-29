FactoryBot.define do
  factory :user do
    nickname { Faker::FunnyName.name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 8) }
    password_confirmation { password }
    family_name { '姓' }
    given_name { '名' }
    family_name_kana { 'セイ' }
    given_name_kana { 'メイ' }
    birth_day { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
