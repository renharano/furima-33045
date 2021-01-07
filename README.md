# テーブル設計

## users テーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| nickname           | string | null: false                   |
| email              | string | null: false, foreign_key: true|
| encrypted_password | string | null: false                   |
| family_name        | string | null: false                   |
| first_name         | string | null: false                   |
| family_name_kana   | string | null: false                   |
| first_name_kana    | string | null: false                   |
| birth_day          | date   | null: false                   |

### Association
- has_many :products dependent: :destroy
- belongs_to :oder dependent: :destroy

## destinationテーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| post_code        | string  | null: false                    |
| prefecture       |string   |null: false                     |
| city             |string   | nill: false                    |
| address          | string  | null: false                    |
| building_name    | string  | ------------------------------ |
| phone_number     | string  | null: false                    |

### Association
- belongs_to :product dependent: :destroy

## oderテーブル

| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| user_id     | integer | null: false, foreign_key: true |
| product_id  | integer | null: false, foreign_key: true |

### Association
- belongs_to :user dependent: :destroy


## productテーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| name          | string  | null: false                    |
| price         | integer | null: false                    |
| description   | text    | null: false                    |
| status_id     | string  | null: false                    |
| size_id       | string  | null: false                    |
| shipping_id   |	string  |	null: false                    |
| judgment_id   | integer | ------------------------------ |
| shipping_id   |	integer |	null: false, foreign_key: true |
| user_id       |	integer	| null: false, foreign_key: true |

### Association
- belongs_to :user dependent: :destroy
