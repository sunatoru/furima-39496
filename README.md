# テーブル設計

## Usersテーブル

| Column             | Type    | Options                    |
| ------------------ | ------- | -------------------------- |
| nickname           | string  | null: false                |
| email              | string  | null: false, unique: true  |
| name (・漢字)       | string  | null: false                |
| name(kana)         | string  | null: false, :name_kana    |
| birth-date         | string  | null: false                |
| password           | string  | null: false                |
| encrypted_password | string  | null: false                |

### Association
- has_many :items


## itemsテーブル

| Column          | type        | Option                         |
| --------------- | ----------- | -------------------------------|
| item-name       | text        | null: false                    |
| user_id         | references  | null: false, foreign_key: true |
| item-content    | text        | null: false                    |
| item-details    | string      | null: false                    |
| item-derivery   | string      | null: false                    |
| item-price      | string      | null: false                    |

### Association
- belongs_to :user
- has_one :buy

## buiesテーブル
| Column          | type        | Option                         |
| --------------- | ----------- | -------------------------------|
|credit-card-info | string      | null: false,                   |
|derivery-country | string      | null: false,                   |
|telephone-number | string      | null: false,                   |

### Association
- belongs_to :item
