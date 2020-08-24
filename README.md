# テーブル設計

## usersテーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| user_id           | string | null: false |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| family_name       | string | null: false |
| given_name        | string | null: false |
| family_name_kana  | string | null: false |
| given_name_kana   | string | null: false |
| birth_year        | string | null: false |
| birth_month       | string | null: false |
| birth_day         | string | null: false |

### Association
- has_many :item
- has_many :purchase

## itemsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_id           | references | null: false, foreign_key: true |
| item_id           | string     | null: false                    |
| item_name         | string     | null: false                    |
| image             | string     | null: false                    |
| detail            | string     | null: false                    |
| price             | string     | null: false                    |
| category          | string     | null: false                    |
| item_status       | string     | null: false                    |
| shipping_fee      | string     | null: false                    |
| shipping_location | string     | null: false                    |
| shipping_date     | string     | null: false                    |

### Association
- belongs_to :user

## purchasesテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_id           | references | null: false, foreign_key: true |
| card_num          | string     | null: false                    |
| valid_month       | string     | null: false                    |
| valid_year        | string     | null: false                    |
| security_code     | string     | null: false                    |

### Association
- belongs_to :user
- has_one :shipping

## shippingsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_id           | references | null: false, foreign_key: true |
| post_code         | string     | null: false                    |
| prefecture        | string     | null: false                    |
| city              | string     | null: false                    |
| block             | string     | null: false                    |
| add_num           | string     | null: false                    |
| bld_name          | string     | null: false                    |
| phone_num         | string     | null: false                    |

### Association
- belongs_to :purchase