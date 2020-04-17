# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|email|string|null: false|
### Association
- has_many :comments
- has_many :posts

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|title|text|null: false|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- belongs_to :product

## makersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|content|text|null: false|
|image|string|null: false|
### Association
- has_many :products

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|maker_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
### Association
- belongs_to :maker
- belongs_to :category
- has_many : posts

## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|post_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :post

