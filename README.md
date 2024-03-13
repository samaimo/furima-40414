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
| birth_year             | string           | null:false              |
| birth_month            | string           | null:false              |
| birth_day              | string           | null:false              |

### Association
- has_many :transactions
- has_many :items


## itemsテーブル

| Column                 | Type             | Options                 |
| ---------------------- | ---------------- | ----------------------- |
| item_name              | string           | null:false              |
| image                  | text             | null:false              |
| description            | string           | null:false              |
| category               | string           | null:false              |
| condition              | string           | null:false              |
| shipping_cost_burden   | string           | null:false              |
| shipping_region        | string           | null:false              |
| price                  | string           | null:false              |
| user_id                | references       | null: false, foreign_key: true |
| transaction_id            | references       | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :transaction


## transactionsテーブル　（購入に必要な情報）
| Column                 | Type             | Options                 |
| ---------------------- | ---------------- | ----------------------- |
| credit_card_number     | string           | null:false              |
| expiration_year        | string           | null:false              |
| expiration_month       | string           | null:false              |
| security_code          | string           | null:false              |
| user_id                | references       | null:false, foreign_key:true |
| item_id                | references       | null:false, foreign_key:true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery_destination



## delivery_destinations
| Column                 | Type             | Options                 |
| ---------------------- | ---------------- | ----------------------- |
| postal_code            | string           | null:false              |
| prefecture             | string           | null:false              |
| city                   | string           | null:false              |
| street_address         | string           | null:false              |
| building_name          | string           | default: nil, null: true |
| phone_number           | string           | null:false              |
| transaction_id            | references       | null:false, foreign_key:true |

### Association
- belongs_to :transaction