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
- has_many :items, dependent: :destroy
- has_many :orders dependent: :destroy


## itemsテーブル

| Column        | Type      | Options                        |
| ------------- | --------- | ------------------------------ |
| name          | string    | null: false                    |
| price         | integer   | null: false                    |
| category_id   | integer   | null: false                    |
| status_id     | integer   | null: false                    |
| text          | text      | null: false                    |
| day_id        |	integer   |	null: false                    |
| judgment_id   | integer   | null: false                    |
| prefecture_id |	integer   |	null: false,                   |
| user          |	reference	| null: false, foreign_key: true |

### Association
- belongs_to :user 
- has_one :oder

## destination テーブル

| Column           | Type    | Options                         |
| ---------------- | ------- | ------------------------------- |
| post_code        | string  | null: false                     |
| prefecture_id    | integer | null: false                     |
| city             | string  | nill: false                     |
| address          | string  | null: false                     |
| building_name    | string  | ------------------------------- |
| phone_number     | string  | null: false                     |
| order            | integer | null: false , foreign_key: true |

### Association
- belongs_to :order 

## orderテーブル
| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| item   | reference | null: false, foreign_key: true |
| user   | reference | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- belongs_to :address