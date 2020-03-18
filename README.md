# README
<img width="1149" alt="スクリーンショット 2020-03-17 13 33 46" src="https://user-images.githubusercontent.com/59165663/76822324-faf29e80-6853-11ea-8ada-7ff0c38b9986.png">

## 使用した技術

|  種別  |  名称  |
| ---- | ---- |
|  開発言語  |  Ruby(ver 2.5.1  |
|  フレームワーク  |  Ruby on Rails(ver 5.2.4.1)  |
|  マークアップ  |  HTML(Haml),CSS(Sass)  |
|  フロントエンド  |  JavaScript(jQuery)  |
|  DB  |  MySQL  |
|  本番環境  |  AWS,EC2  |
|  Webサーバー  |  Nginx  |
|  applicationサーバー  |  Unicorn  |
|  画像アップロード  |  carrierwave,AWS,S3  |
|  自動デプロイ  |  capistrano  |
|  ユーザー管理  |  devise  |
|  決済機能  |  pay.jp  |

## postsテーブル

|Column|Type|Options|
|------|----|-------|
|body|text||
|image|string||
|group|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false, index: true|
|name|string|null: false, unique: true|
### Association
- has_many :groups_users
- has_many :groups, through: :groups_users
- has_many :messages

## relationsテーブル
|Column|Type|Options|
|------|----|-------|
|user|string|null: false, unique:true|
|follow|
### Association
- has_many :groups_users
- has_many :users, through: :groups_users
- has_many :messages

## comments
|column|Type|Options|
|------|----|-------|
|use|
|post|
|text|

### Association



## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|card|references|null: false, foreign_key: true|
|customer|

### Association
- belongs_to :group
- belongs_to :user

## コンセプト
コンテンツ販売プラットフォーム「Brain」を参考に、  
投稿した記事を、有料で買える仕組み

## 実装機能
・ログイン機能(メールアドレス)  
・投稿機能(画像、値段設定)  
・編集、削除機能  
・コメント機能  
・検索機能  
・フォロー機能  
・決済機能 
・ページネーション  
・AWSでの自動デプロイ  

## 実装予定
・カテゴリー機能  
・フォローしたユーザーの投稿表示  
・JQueryを使った動き  

## 使い方
http://3.114.144.37/ にアクセスして頂くとご覧いただけます。  
・右上の新規登録をおこなってください。  
・ログインすると、「投稿する」から記事を投稿できます。  
→ログアウトする場合は、右上のアカウントマークを押し、ログアウトを押してください。  
→タイトル、本文、画像、値段を入力して投稿してください。  
・トップページにはそれぞれの投稿が表示され、クリックすると  
 記事の詳細や、投稿者のマイページに遷移することができます。  
・記事を購入する場合は、値段ボタンを押してください。  
 →クレジットカード登録画面にうつるので、入力すると購入確認ページへ遷移します。  


