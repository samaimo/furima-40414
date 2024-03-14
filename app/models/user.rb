class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 入力必須（ニックネーム、氏名、カナ氏名、誕生日）
  validates :nickname, :last_name, :first_name, :kana_first_name, :kana_last_name, :birth_day,
            presence: true

  # お名前（全角）は全角（漢字/ひらがな/カタカナ）が必須
  validates :last_name, :first_name, presence: true,
                                     format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角の漢字・ひらがな・カタカナで入力してください' }
  # お名前カナ(全角)は、全角（カタカナ）での入力が必須
  validates :kana_last_name, :kana_first_name, presence: true,
                                               format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナで入力してください' }
end
