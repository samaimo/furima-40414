class DeliveryDestination < ApplicationRecord
  #アソシエーション
  belongs_to :order
end
