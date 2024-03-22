class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number, :order_id, :token, :price

  # 空白を許可しない
  validates :user_id, :item_id, presence: true
  validates  :token, :postal_code,:prefecture_id,:city,:street_address,:phone_number,presence: { message: 'を入力してください' }
  # 郵便番号は「3桁ハイフン4桁」の半角文字列のみ
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'は「3桁ハイフン4桁」の半角文字列で入力してください' }
  # 電話番号10桁以上11桁以内の半角数値のみ
  validates :phone_number, format: { with: /\A\d{10,11}\z/ , message: 'は電話番号10桁以上11桁以内の半角数値を入力してください' }
  #　都道府県の入力の必須 ( 1以外の数値の入力必須)
  validates :prefecture_id, numericality: {other_than: 1, message: "を入力してください"}

  # 各テーブルにデータを保存する処理を書く
  def save
     # 購入情報を保存する処理
    order = Order.create(user_id: user_id, item_id: item_id)
    # 発送先情報を保存する処理
    delivery_destination = DeliveryDestination.create(
      order_id: order.id,
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      street_address: street_address,
      building_name: building_name,
      phone_number: phone_number
    )
  end

end