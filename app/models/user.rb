class User < ApplicationRecord
  has_many :items
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,
                                                   message: 'は漢字か平仮名かかなを含める必要があります' }

  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,
                                                  message: 'は漢字と平仮名のみを含める必要があります' }

  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/,
                                                        message: 'はカナ文字のみを含める必要があります' }

  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/,
                                                       message: 'はカナ文字のみを含める必要があります' }

  validates :birth_date, presence: true

  validate :password_complexity
  def password_complexity
    return unless password.present? && !password.match(/^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+$/)

    errors.add :password, 'は少なくとも1つの英字と1つの数字を含む必要があります'
  end
end
