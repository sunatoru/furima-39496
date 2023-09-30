class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :item_name, presence: { message: 'は商品名を入力してください' }
  validates :item_content, presence: { message: 'は商品の説明を入力してください' }
  validates :item_price, presence: { message: 'は商品の価格を入力してください' }
  validates :item_price, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    only_integer: true,
    message: 'は商品の価格は300から9,999,999の範囲内である必要があります'
  }


  validate :image_presence

  def image_presence
    if !image.attached?
      errors.add(:image, '画像を添付してください')
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_country
  belongs_to :delivery_date
  belongs_to :delivery_charge
  # ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1, message: "はカテゴリーを選んでください" }
  validates :condition_id, numericality: { other_than: 1, message: "は商品の状態を選んでください" }
  validates :delivery_country_id, numericality: { other_than: 1, message: "は配送先を選んでください" }
  validates :delivery_date_id, numericality: { other_than: 1, message: "は配達までにかかる日数を選択してください" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "は配達にかかる金額を負担する人を選択してください" }
end
