# furima_27348 DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|mail|string|null: false, unique: true, index: true|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
### Association
- has_many :items
- has_many :comments

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|name|string|null: false|
|introduction|text|null: false|
|category_id|integer|null: false, foreign_key: true|
|item_condition|string|null: false|
|postage_payer|string|null: false|
|prefecture_code_id|integer|null: false, foreign_key: true|
|preparation_day|string|null: false|
|price|integer|null: false|
### Association
- belongs_to :user
- has_many :comments
- has_many :sending_destinations
- belongs_to_active_hash :category
- belongs_to_active_hash :prefecture_code

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## sending_destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|integer|null: false|
|prefecture_code_id|integer|null: false, foreign_key: true|
|city|string|null: false|
|building_name|string||
|phone_number|string|null: false, unique: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to_active_hash :prefecture_code