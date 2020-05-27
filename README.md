## LookForDartsとは？
ダーツの口コミを発信、共有できるアプリです。  


- URL  
* ゲストログイン方法
  * パスワード  12345678  
  * メールアドレス  a@a  



![readme](https://user-images.githubusercontent.com/60651352/83035673-b580f780-a074-11ea-8387-c21c4f580027.jpg)  


## 制作背景
私は趣味でダーツをよくします。  
ダーツを購入しても意外と種類も多く買ってみたけどなんか違うなと思うことがかなりあります。  
しかもショップは都会にしかなく田舎者はオンラインショップで購入するしかないので物を見て買えません。  
そんな思いからリアルな口コミを共有し実際に足を運んで買えない人達の役に立てればいいよね、と思い制作してみました。  



## 何ができるのか？(機能)
* LookForDartsは、以下のことができます。  
新規登録、ログイン、ログアウト機能  
登録情報編集  
投稿(タイトル,画像,カテゴリー,メーカー,テキスト)  
投稿一覧(ユーザー,カテゴリー,メーカー)  
投稿詳細(編集、削除)  
投稿検索(一覧表示)  
コメント(ログインのみ)  


## 使用技術
 * ruby 2.5.1
 * Rails 5.2.4.3
 * Bootstrap,Sass,jQuery
 * AWS(VPC,EC2,ALB,RDS,S3,Route53)
 * Git, Github
 * MYSQL 5.7.30



## ER図
![ERLookForDarts](https://user-images.githubusercontent.com/60651352/83035605-9c784680-a074-11ea-9a85-437658a13a91.jpg)



# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
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
|image|text|null: false|
|user_id|references|null: false, foreign_key: true|
|maker_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :comments
- belongs_to :category
- belongs_to :maker

## makersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|null: false|
### Association
- belongs_to :post

## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|null: false|
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