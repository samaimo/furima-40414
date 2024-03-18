FactoryBot.define do
  factory :item do
    association :user

    item_name { 'カニ' }
    description	 { '元気で明るい性格の一匹のカニです！' }
    category_id	 { Faker::Number.between(from: 2, to: 11) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    shipping_cost_burden_id { Faker::Number.between(from: 2, to: 3) }
    delivery_days_id { Faker::Number.between(from: 2, to: 4) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    price { Faker::Number.within(range: 300..9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
