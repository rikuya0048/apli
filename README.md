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
|body|text|null: false|
|image|text||null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false, index: true|
|name|string|null: false, unique: true|
### Association
- has_many :posts

## relationsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false, unique:true|
|follow_id|string|null: false, foreign_key: true|
### Association
- has_many :users

## comments
|column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|post_id|references|null: false, foreign_key: true|
|text|text|null: false|

### Association
- belongs_to: user


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|card_id|string|null: false|
|customer_id|string|null: false|

### Association
- belongs_to :user

## 制作背景
自分が利用してるもので馴染み深いものを作ってみようと思った。
その中で、コンテンツ販売プラットフォーム「Brain」を参考にし、
もっとユーザーが利用しやすくできるのではないかと思って制作した。

## 工夫したポイント
検索ボタン、ユーザーボタンを押したときに、フォームやメニューが表示されるように
jQueryを使うのに少し苦労した。また、要素全体をクリック対象にするように
CSSの範囲をどう広げられるかも工夫した。
初めて使う人でも、操作しやすいようにシンプルな見た目を心がけた。

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


