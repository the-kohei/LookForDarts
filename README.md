# 概要
LookForDartsはダーツの口コミを発信、共有できるアプリです。

## 何ができるのか？(機能)
LookForDartsは、以下のことができます。
・ユーザー新規登録/ログイン/ログアウト/編集
・ダーツの投稿機能/一覧/詳細/編集/削除
・投稿にコメントする
・検索機能
・投稿をユーザー、カテゴリー、メーカーから探す


## 用途



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
|maker_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
### Association
- has_many :comments
- belongs_to :product
- belongs_to :user
- belongs_to :maker
- belongs_to :category
## makersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|content|text|null: false|
|image|string|null: false|
### Association
- belongs_to :post

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|post_id|references|null: false, foreign_key: true|
### Association
- belongs_to :posts

## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- belongs_to :post

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|post_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :post

