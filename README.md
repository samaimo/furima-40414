# README

## usersテーブル

| Column                 | Type             | Options                 |
| ---------------------- | ---------------- | ----------------------- |
| nickname               | string           | null:false              |
| email                  | string           | null:false, unique:true |
| encrypted_password     | string           | null:false              |
| last_name              | string           | null:false              |
| first_name             | string           | null:false              |
| kana_last_name         | string           | null:false              |
| kana_first_name        | string           | null:false              |
| birth_day              | date             | null:false              |

### Association
- has_many :oders
- has_many :items


## itemsテーブル　（商品情報）

| Column                    | Type             | Options                 |
| ------------------------- | ---------------- | ----------------------- |
| item_name                 | string           | null:false              |
| description               | text             | null:false              |
| category_id               | integer          | null:false              |
| condition_id              | integer          | null:false              |
| shipping_cost_burden_id   | integer          | null:false              |
| delivery_days_id          | integer          | null:false              |
| prefecture_id             | integer          | null:false              |
| price                     | integer          | null:false              |
| user                      | references       | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :oder


## odersテーブル　（購入に必要な情報）
| Column                 | Type             | Options                 |
| ---------------------- | ---------------- | ----------------------- |
| user                   | references       | null:false, foreign_key:true |
| item                   | references       | null:false, foreign_key:true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery_destination



## delivery_destinations （配送情報）
| Column                 | Type             | Options                 |
| ---------------------- | ---------------- | ----------------------- |
| postal_code            | string           | null:false              |
| prefecture_id          | integer          | null:false              |
| city                   | string           | null:false              |
| street_address         | string           | null:false              |
| building_name          | string           | default: nil, null: true |
| phone_number           | string           | null:false              |
| oder            | references       | null:false, foreign_key:true |

### Association
- belongs_to :oder