# テーブル設計

## users

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| nickname       | string  | null: false |
| email          | string  | null: false |
| last_name      | string  | null: false |
| first_name     | string  | null: false |
| last_name      | string  | null: false |
| first_furigana | string  | null: false |
| last_furigana  | string  | null: false |
| year           | integer | null: false |
| month          | integer | null: false |
| date           | integer | null: false |

### Association

- has_many :items
- has_many :user_residences
- has_many :residences, through: :user_residences

## items

| Column        | Type       | Options                       |
| ------------- | -----------| ----------------------------- |
| item_name     | text       | null: false                   |
| explanation   | text       | null: false                   |
| category      | string     | null: false                   |
| condition     | string     | null:false                    |
| fee           | string     | null:false                    |
| date          | string     | null:false                    |
| price         | integer    | null:false                    |
| image         | text       | null:false                    |
| shipping_area | string     | null:false                    |
| delivery_date | text       | null:false                    |
| user_id       | references | null:false, foreign_key: true |

### Association
- belongs_to :users
- has_one :user_residences

## user_residences

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| user_id      | references | null:false, foreign_key: true |
| item_id      | references | null:false, foreign_key: true |
| residence_id | references | null:false, foreign_key: true |
### Association

- belongs_to :users
- belongs_to :items
- belongs_to :residences

## residences

| Column        | Type      | Options     |
| ---------     | --------- | ----------- |
| postal_code   | integer   | null:false  |
| prefectures   | string    | null:false  |
| municipality  | text      | null:false  |
| address       | string    | null:false  |
| building_name | string    | unique:true |
| phone_number  | integer   | null:false  |

### Association

- has_many :user_residences
- hsa_many :user, through: :user_residences

