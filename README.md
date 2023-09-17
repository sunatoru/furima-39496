# テーブル設計

## Usersテーブル

| Column                   | Type    | Options                    |
| ------------------------ | ------- | -------------------------- |
| nickname                 | string  | null: false                |
| email                    | string  | null: false, unique: true  |
| name(first-name) (・漢字) | string  | null: false                |
| name(last-name) (・漢字)  | string  | null: false                |
| name(name_kana)  (first) | string  | null: false, :name_kana    |
| name(name_kana)  (last)  | string  | null: false, :name_kana    |
| birth-date               | date    | null: false                |
| encrypted_password       | string  | null: false                |

### Association
- has_many :items
- has_many :orders
- has_one :addresses

## itemsテーブル

| Column          | type        | Option                         |
| --------------- | ----------- | -------------------------------|
| item-name       | string      | null: false                    |
| user            | references  | null: false, foreign_key: true |
| item-content    | text        | null: false                    |
| item-details    | string      | null: false                    |
| item-derivery   | string      | null: false                    |
| item-price      | string      | null: false                    |

### Association
- belongs_to :user
- has_one :buy

## Ordersテーブル
| Column          | type        | Option                         |
| --------------- | ----------- | -------------------------------|
|credit-card-info | string      | null: false,                   |
|derivery-country | string      | null: false,                   |
|telephone-number | string      | null: false,                   |
|user             | references  | null: false, foreign_key: true |
|derivery-country | string      | null: false,                   |
|telephone-number | string      | null: false,                   |

### Association
- belongs_to :item
- belongs_to :user
- has_one :addresses


## Addressesテーブル

| Column          | type        | Option                         |
| --------------- | ----------- | -------------------------------|
| postal-code     | string      | null: false                    |
| country         | string      | null: false                    |
| city            | string      | null: false                    |
| adress          | string      | null: false                    |
| building        | string      | null: false                    |
| telepone-number | string      | null: false                    |
| addresses       | references  | null: false, foreign_key: true |


### Association
- belongs_to :order