class Item < ApplicationRecord
  # 入力必須項目
  validates :item_name, :description, :category_id, :condition_id,
            :shipping_cost_burden_id, :delivery_days_id, :prefecture_id,
            :price, :user,
            presence: true
  # 商品カテゴリーの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }

  # アソシエーション
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
end
