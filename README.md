# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association
- has_many :products dependent: :destroy
- has_many :orders dependent: :destroy

## destinationテーブル

| Column           | Type    | Options                         |
| ---------------- | ------- | ------------------------------- |
| post_code        | string  | null: false                     |
| prefecture_id    | integer | null: false                     |
| city             | string  | nill: false                     |
| address          | string  | null: false                     |
| building_name    | string  | ------------------------------- |
| phone_number     | string  | null: false                     |
| order_id         | integer | null: false , foreign_key: true |

### Association
- belongs_to: order

## orderテーブル

| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| user_id     | integer | null: false, foreign_key: true |
| product_id  | integer | null: false, foreign_key: true |

### Association
- belongs_to :user dependent: :destroy
- belongs_to :product
- has_one :destination


## productテーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| name          | string  | null: false                    |
| price         | integer | null: false                    |
| description   | text    | null: false                    |
| status_id     | integer | null: false                    |
| size_id       | integer | null: false                    |
| shipping_id   |	integer |	null: false                    |
| judgment_id   | integer | ------------------------------ |
| shipping_id   |	integer |	null: false, foreign_key: true |
| user_id       |	integer	| null: false, foreign_key: true |

### Association
- belongs_to :user dependent: :destroy
- has_one :order
