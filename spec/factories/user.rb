FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 4) }
    email                 { Faker::Internet.email }
    password              { "1a#{Faker::Internet.password(min_length: 6)}" }
    password_confirmation { password }
    first_name            { '大輔' }
    last_name             { '高橋' }
    first_name_kana       { 'ダイスケ' }
    last_name_kana        { 'タカハシ' }
    birth_date            { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
