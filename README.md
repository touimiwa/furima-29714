# テーブル設計

## users テーブル

| Column                | Type     | Options     |
| --------------------- | -------- | ----------- |
| nickname              | string   | null: false |
| email                 | string   | null: false |
| password              | string   | null: false |
| password_confirmation | string   | null: false |
| last_name             | string   | null: false |
| first_name            | string   | null: false |
| kanalast_name         | string   | null: false |
| kanafirst_name        | string   | null: false |
| birthday              | datetime | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| image_id     | string     | null: false                    |
| description  | text       | null: false                    |
| category_id  | text       | null: false                    |
| condition_id | text       | null: false                    |
| charges_id   | integer    | null: false                    |
| area_id      | string     | null: false                    |
| days_id      | integer    | null: false                    |
| price        | string     | null: false                    |
| users_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :buys

## buys テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card            | integer    | null: false                    |
| expiration_date | datetime   | null: false                    |
| security_code   | integer    | null: false                    |
| users_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :delivery

## delivery テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postal_cord    | integer | null: false |
| prefectures_id | string  | null: false |
| municipality   | string  | null: false |
| address        | string  | null: false |
| building       | text    |             |
| phone_number   | integer | null: false |

### Association

- belongs_to :buys