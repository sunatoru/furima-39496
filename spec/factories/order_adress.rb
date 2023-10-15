FactoryBot.define do
  factory :order_address do
    postal_code { Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s }
    delivery_country_id { Faker::Number.between(from: 2, to: 48) }
    city { '東京都千代田区' }
    address { Faker::Address.street_address }
    building { Faker::Address.secondary_address }
    telephone_number { Faker::Number.number(digits: rand(3) + 10) }
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
  end
end