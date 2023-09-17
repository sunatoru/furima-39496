# テーブル設計

## Usersテーブル

| Column                   | Type    | Options                    |
| ------------------------ | ------- | -------------------------- |
| nickname                 | string  | null: false                |
| email                    | string  | null: false, unique: true  |
| first_name               | string  | null: false                |漢字
| last_name                | string  | null: false                |漢字
| first_kana               | string  | null: false                |カナ
| last_kana                | string  | null: false                |カナ
| birth_date               | date    | null: false                |
| encrypted_password       | string  | null: false                |

### Association
- has_many :items
- has_many :orders


## itemsテーブル

| Column          | type        | Option                         |
| --------------- | ----------- | -------------------------------|
| item_name       | string      | null: false,                   |
| user            | references  | null: false, foreign_key: true |
| item-content    | text        | null: false                    |
| category        | string      | null: false, category_id       |
| condition       | string      | null: false, condition_id,     |
| delivery_country| string      | null: false,delivery_country_id|
| delivery_date   | string      | null: false,delivery_date_id   |
| delivery_charge | string      | null: false,delivery_charge_id |
| item_price      | integer     | null: false                    |

### Association
- belongs_to :user
- has_one :buy

## Ordersテーブル
| Column           | type        | Option                         |
| ---------------- | ----------- | -------------------------------|
| credit_info      | string      | null: false                    |
| user             | references  | null: false, foreign_key: true |
| item             | references  | null: false, foreign_key: true |
### Association
- belongs_to :item
- belongs_to :user
- has_one :addresses



## Addressesテーブル

| Column          | type        | Option                         |
| --------------- | ----------- | -------------------------------|
| postal_code     | string      | null: false                    |
| delivery_country| string      | null: false,delivery_country_id|
| city            | string      | null: false                    |
| address         | string      | null: false                    |
| building        | string      |                                |
| telephone_number| string      | null: false                    |
| order           | references  | null: false, foreign_key: true |


### Association
- belongs_to :order