# テーブル設計

## usersテーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| family_name       | string | null: false |
| given_name        | string | null: false |
| family_name_kana  | string | null: false |
| given_name_kana   | string | null: false |
| birth_day         | date   | null: false |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| item_name         | string     | null: false                    |
| image             | string     | null: false                    |
| detail            | text       | null: false                    |
| price             | integer    | null: false                    |
| category          | integer    | null: false                    |
| item_status       | integer    | null: false                    |
| shipping_fee      | integer    | null: false                    |
| shipping_location | integer    | null: false                    |
| shipping_date     | integer    | null: false                    |

### Association
- belongs_to :user
- belongs_to :purchase

## purchasesテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

### Association
- has_many :items
- belongs_to :user
- has_one :shipping

## shippingsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| purchase          | references | null: false, foreign_key: true |
| post_code         | string     | null: false                    |
| prefecture        | integer    | null: false                    |
| city              | string     | null: false                    |
| block             | string     | null: false                    |
| add_num           | string     | null: false                    |
| bld_name          | string     | null: true                     |
| phone_num         | string     | null: false                    |

### Association
- belongs_to :purchase