# README


## users テーブル

| Column                | Type      | Options     |
| -------------------   | --------- | ----------- |
| nick_name             | string    | null:false  |
| first_name            | string    | null:false  |
| family_name           | string    | null:false  |
| first_name_kana       | string    | null:false  |
| family_name_kana      | string    | null:false  |
| email                 | string    | null:false  |
| password              | string    | null:false  |
| password_confirmation | string    | null:false  |
| birth                 | date      | null:false  |

### Association

- has_many :items
- has_many :purchases



## orders  テーブル

| Column                      | Type       | Options    |
| --------------------------- | ---------- | ---------- |
| post_code                   | string     | null:false |
| prefecture_code             | integer    | null:false |
| city                        | string     | null:false | 
| house_number                | string     | null:false | 
| building_name               | string     |            |
| phone_number                | string     | null:false | 
| purchase_id                 | integer    | null:false, foreign_key: true |


### Association

- belongs_to :purchase


## items テーブル

| Column             | Type     | Options    |
| ------------------ | -------- | ---------- |
| image              | string   | null:false |
| name               | string   | null:false |
| category           | integer  | null:false |
| condition          | integer  | null:false |
| postage_type       | integer  | null:false |
| preparation_day    | integer  | null:false |
| shipping_region    | integer  | null:false |
| selling_price      | integer  | null:false |
| explanation        | text     | null:false |
| user_id            | integer  | null:false, foreign_key: true |

### Association
- has_one :purchase
- belongs_to :user



## purchase テーブル

| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| user_id    | integer    | null:false, foreign_key: true |
| item_id    | integer    | null:false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :order

