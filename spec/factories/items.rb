FactoryBot.define do
  factory :item do
    # 画像のファイルパスを指定してアタッチ
    image do
      Rack::Test::UploadedFile.new(
        Rails.root.join('app', 'assets', 'images', 'furima-header02.png'), # 画像ファイルのパスを指定
        'image/jpeg' # 画像のコンテントタイプに合わせて変更
      )
    end
    item_name { Faker::Commerce.product_name }
    item_content { Faker::Lorem.sentence }
    item_price { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    delivery_country_id { Faker::Number.between(from: 2, to: 48) }
    delivery_date_id { Faker::Number.between(from: 2, to: 48) }
    delivery_charge_id { Faker::Number.between(from: 2, to: 3) }
    association :user
  end
end
