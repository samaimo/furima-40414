class Item < ApplicationRecord
  # 入力必須項目
  validates :item_name, :description, :category_id, :condition_id,
            :shipping_cost_burden_id, :delivery_days_id, :prefecture_id,
            :price, :user,
            presence: true
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
