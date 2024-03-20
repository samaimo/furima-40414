class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 入力必須（ニックネーム、氏名、カナ氏名、誕生日）
  validates :nickname, :last_name, :first_name, :kana_first_name, :kana_last_name, :birth_day,
            presence: { message: 'を入力してください' }

  # ニックネーム/苗字/名前 は全角（漢字/ひらがな/カタカナ）が必須
  validates :last_name, :first_name, presence: true,
                                     format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角の漢字・ひらがな・カタカナで入力してください' }
  # お名前カナ(全角)は、全角（カタカナ）での入力が必須
  validates :kana_last_name, :kana_first_name, presence: true,
                                               format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角カタカナで入力してください' }
  # パスワードは英数字混合の入力が必須
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  # アソシエーション
  has_many :items
  has_many :orders
end
