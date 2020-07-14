# furima_27348 DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|mail|string|null:false, unique:true, index:true|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null:false|
|first_name_kana|string|null: false|
|birth_year|date|null: false|
|birth_month|date|null: false|
|birth_day|date|null: false|
### Association
- has_many :items
- has_many :comments
- has_many :credit_cards

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_img|string|null:false|
|name|string|null: false|
|introduction|text|null: false|
|category|string|null: false|
|item_condition|string|null:false|
|postage_payer|string|null: false|
|prefecture_code|integer|null: false|
|preparation_day|string|null: false|
|price|integer|null: false|
### Association
- belongs_to :user
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false, unique: true|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## sending_destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|integer|null: false|
|prefecture_code|integer|null: false|
|city|string|null: false|
|building_name|string||
|phone_number|integer|null: false, unique: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
