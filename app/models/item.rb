class Item < ApplicationRecord
  # 入力必須項目
  validates :item_name, :description, :category_id, :condition_id,
            :shipping_cost_burden_id, :delivery_days_id, :prefecture_id,
            :price, :user,
            presence: true
  # アソシエーション
  belongs_to :user
end
