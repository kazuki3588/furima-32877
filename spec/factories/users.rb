FactoryBot.define do
  factory :user do
    name { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { 'ramosu1234' }
    password_confirmation { password }
    last_name { '藏モと' }
    first_name { '火ずキ' }
    last_furigana { 'クラモト' }
    first_furigana { 'カズキ' }
    date { Faker::Date.between(from: '1930-01-01', to: '2016-12-31') }
  end
end
