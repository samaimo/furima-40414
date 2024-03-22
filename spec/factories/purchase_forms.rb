FactoryBot.define do
  factory :purchase_form do
    user_id                   { 1 }
    item_id                   { 1 }
    postal_code               { "466-0031" }
    prefecture_id                 { 1 }
    city                      { "名古屋市中区" }
    street_address            { "本丸1-1" }
    building_name             { "名古屋城" }
    phone_number              { "0522311655" }
    token                     {"tok_abcdefghijk00000000000000000"}

  end
end
