FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '中山' }
    first_name            { 'きんに君' }
    kana_last_name        { 'ナカヤマ' }
    kana_first_name       { 'キンニクン' }
    birth_day             { Faker::Date.birthday }
  end
end
