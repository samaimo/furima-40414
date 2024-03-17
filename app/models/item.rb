class Item < ApplicationRecord
  # 入力必須項目
  validates :item_name, :description, :category_id, :condition_id, :shipping_cost_burden_id, :delivery_days_id, :prefecture_id, :price,
            presence: { message: 'を入力してください' }

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                    message: 'は300円以上9,999,999円以内の半角数値で入力してください' }

  validates :user, presence: true
  validates :image, presence: { message: '画像を添付してください' }
  # プルダウン式の選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_cost_burden_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_days_id, numericality: { other_than: 1, message: "can't be blank" }
  # アソシエーション
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost_burden
  belongs_to :prefecture
  belongs_to :delivery_days
end
