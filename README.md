# テーブル設計

## users テーブル

| Column           | Type     | Options     |
| ---------------- | -------- | ----------- |
| nickname             | string   | null: false |
| email            | string   | null: false |
| encrypted_password | string   | null: false |
| family_name      | string   | null: false |
| first_name       | string | null: false|
| family_name_kana | string   | null: false |
| first_name_kana  | string   | null: false |
| birth_day        | date | null: false |

## product テーブル

| Column        | Type     | Options                        |
| ------------- | -------- | ------------------------------ |
| name          | string   | null: false                    |
| price         | integer  | null: false                    |
| description   | text     | null: false                    |
| status        | text     | null: false                    |
| judgment      | boolean  | null: false                    |
| size          | string   | null: false                    |
| size          | string   | null: false                    |
| days          | datetime | null: false                    |
| cost          | integer  | null: false                    |
| prefecture_id | text     | null: false                    |
| category_id   | text     | null: false, foreign_key: true |
| brand_id      | text     | null: false, foreign_key: true |
| user_id       | text     | null: false, foreign_key: true |

## destination テーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| family_name      | string  | null: false                    |
| first_name       | string  | null: false                    |
| family_name_kana | string  | null: false                    |
| first_name_kana  | string  | null: false                    |
| post_code        | integer | null: false                    |
| prefecture       | string  | null: false                    |
| city             | string  | null: false                    |
| address          | text    | null: false                    |
| buildings_name   | text    | null: false                    |
| phone_number     | integer | null: false                    |
| user_id          | text    | null: false, foreign_key: true |
