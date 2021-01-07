# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |

### Association
- has_many :products dependent: :destroy
- belongs_to :card dependent: :destroy

## destinationテーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| user_id          | integer | null: false, foreign_key: true |
| post_code        | string  | null: false                    |
| prefecture       |string   |null: false                     |
| city             |string   | nill: false                    |
| address          | string  | null: false                    |
| building_name    | string  | ------------------------------ |
| phone_number     | string  | null: false                    |

### Association
- belongs_to :product

## cardテーブル

| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| user_id     | integer | null: false, foreign_key: true |
| product_id  | integer | null: false, foreign_key: true |

### Association
- belongs_to :user

## productテーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| name          | string  | null: false                    |
| price         | integer | null: false                    |
| description   | text    | null: false                    |
| status        | string  | null: false                    |
| size          | string  | null: false                    |
| shipping_cost | string  | null: false                    |
| shipping_days |	string  |	null: false                    |
| judgment_id   | integer | ------------------------------ |
| shipping_id   |	integer |	null: false, foreign_key: true |
| user_id       |	integer	| null: false, foreign_key: true |

### Association
- belongs_to :user dependent: :destroy
- belongs_to :destination dependent: :destroy
