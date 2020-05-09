# README
<img width="821" alt="スクリーンショット 2020-05-08 1 32 31" src="https://user-images.githubusercontent.com/59165663/81320243-d5537a00-90cb-11ea-825a-1724dc77c8a1.png">

## アプリケーションの概要
クリエイーターやフリーランス同士のコミュニティサイトです。  
http://3.114.144.37/ にアクセスして頂くとご覧いただけます。

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

## 実装機能
・ログイン機能  
・ユーザー編集機能  
・投稿機能(編集・削除)    
・コメント機能  
・検索機能  
・フォロー機能  
・チャット機能  
・カテゴリー機能  
・Payjp決済機能  
・ページネーション   
・AWSでの自動デプロイ   

## 実装予定
・カテゴリーボックス（JSを使った動的表示） 
・フォローしたユーザーの投稿表示  
・SNS連携やAPI  

## postsテーブル

|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|content|text|null: false|
|image|text|null: false|
|price|integer|null: false|
|category_id|string|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false, index: true|
|name|string|null: false, unique: true|
|age|text||
|gender|text||
|area|text||
|hobby|text||
|introduction|text||
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
エンジニアやフリーランスの人と関わる機会があったのですが、
ITが進んだいまの時代だからこそ人と人との繋がりや出会いが重要視されてるように感じました。

以前にランサーズやクラウドワークスなどを利用したことがあるのですが、
お仕事の発注という面では良いサービスだと思ったものの、お仕事以外にも
繋がれるチャンスがあれば面白いのではないかと考えました。

人と人との繋がりや会話の中でお仕事が生まれることもあり、いろいろな人と交流を深めることで
フリーランスの人は活動しやすく、企業側にとっては採用の観点でも気の合う人と仕事できるといったメリットがあり、
幅広くフリーランスの人のコミュニティサイトみたいな感じで、マッチングできるようなサービスがあったら
おもしろいと考えました。

## 工夫したポイント
トップページの見やすさや、誰でも使いやすいことを意識した。 
「仕事をしたい」というカテゴリーが、お仕事の募集一覧で表示されるようにした。  
検索ボタン、ユーザーボタンを押したときに、フォームやメニューが表示されるように
jQueryを使うのに少し苦労した。また、要素全体をクリック対象にするように
CSSの範囲をどう広げられるかも工夫した。

## 使い方  
・右上の新規登録をおこなってください。  
・ログインすると、「投稿する」から記事を投稿できます。  
→ログアウトする場合は、右上のアカウントマークを押し、ログアウトを押してください。  
→タイトル、本文、画像、値段を入力して投稿してください。  
・トップページにはそれぞれの投稿が表示され、クリックすると  
 記事の詳細や、投稿者のマイページに遷移することができます。  
・記事を購入する場合は、値段ボタンを押してください。  
 →クレジットカード登録画面にうつるので、入力すると購入確認ページへ遷移します。 
 ※クレジットカード番号はテスト用で42424...と最大限まで入力してください
 ※有効期限などは適当で大丈夫です。


