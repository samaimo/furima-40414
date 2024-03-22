FactoryBot.define do
  factory :purchase_form do
    postal_code               { "466-0031" }
    prefecture_id             { Faker::Number.between(from: 2, to: 48) }
    city                      { "名古屋市中区" }
    street_address            { "本丸1-1" }
    building_name             { "名古屋城" }
    phone_number              { "0522311655" }
    token                     {"tok_abcdefghijk00000000000000000"}

  end
end
