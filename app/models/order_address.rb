class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_country_id, :city, :address, :building, :telephone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は漢字か平仮名かかなを含める必要があります' }
    validates :address, presence: { message: 'は番地を記入してください' }
    validates :telephone_number, format: {with: /\A[0-9]{10,11}\z/, message: "は数字のみかつ10桁以上11桁以下の電話番号を入力してください"}
    validates :user_id
    validates :item_id
  end
  validates :delivery_country_id, numericality: { other_than: 1, message: 'は配送先を選んでください' }

  validate :custom_postal_code_validation

  def save
    order = Order.create(item: item_id, user_id: user_id)

    Address.create(postal_code: postal_code, delivery_country_id: delivery_country_id, city: city, address: address, building: building, telephone_number: telephone_number, order_id: order.id)
  end

  private

  def custom_postal_code_validation
    if postal_code.present?
      # 郵便番号がハイフンを含む場合、ハイフンの前が3桁でない場合
      unless postal_code.match?(/\A\d{3}-\d{4}\z/)
        errors.add(:postal_code, "はハイフン(-)の前が3桁とハイフン(-)の後が4桁の数字でないと無効です")
      end
    end
  end
end