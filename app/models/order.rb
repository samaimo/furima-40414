class Order < ApplicationRecord
  attr_accessor :token, :price


  # アソシエーション
  belongs_to :user
  belongs_to :item
  has_one :delivery_destination
end
