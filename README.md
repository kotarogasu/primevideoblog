# README

# Overview
  某動画配信サイトに依存した映画、番組のblog共有と作品検索アプリです。  
  https://primevideoblog.herokuapp.com/  

  ![スクリーンショット 2020-02-09 11 44 09](https://user-images.githubusercontent.com/56858292/74095247-82504200-4b31-11ea-93c0-d42fdbef2a13.png)


# Development background
  【開発意図】  
  ・Blogアプリとして  
  個人的にヘビーユーザーであるが知人にオススメしたい時に各作品のストーリーや見所を失念してしまうことがあります。レビュー形式で備忘録的なアプリがあってもいいなと。

  ・検索アプリとして  
  見たことの無い作品を見ようとする時にサムネ画像や作品説明等を見て判断するが、その時の気分や感情で作品ジャンルや他のユーザーのレビューやタグ検索ができると見たい作品にたどり着きやすいかなと考えます。

# function
  ・railsの一般的なCRUD。   
  ・ユーザー機能。 devise活用。  
  ・タグ投稿と検索機能。 acts-as-taggable-on活用。  
  ・作品カテゴリーと分類 ancestry活用。  
  ・動的スライダー bxslider活用。  
  ・検索機能→タイトル、レビューワード、タグ、出演者情報のワード。 ransack活用。  
  ・投稿を楽にする為に当該URLでスクレピングを活用し必要情報をDB保存。 nokogiri活用  
  ・投稿フォームとタグはbootstrap活用  
  ・スマホ用レスポンシブ  

  <img width="386" alt="スクリーンショット 2020-02-09 11 41 57" src="https://user-images.githubusercontent.com/56858292/74095234-3f8e6a00-4b31-11ea-9cf3-e33fee6fd250.png">

# Testacount
  アドレス：1@gmail.com  
  パスワード：password  
  （ログインしなくても作品閲覧、検索できます）  

# 備考
  投稿時はスクレイピングするのでamazonprimevideoのブラウザの作品ごとのurlをコピペしてください。  

  <img width="1549" alt="スクリーンショット 2020-02-09 11 34 21" src="https://user-images.githubusercontent.com/56858292/74095182-67310280-4b30-11ea-82a8-1b896b835df0.png">   

  実際に動画を見る場合は投稿詳細ページのリンクボタンでprimevideoブラウザに移動してください。


#  DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false,unique:ture|
|username|string|null: false|
### Association

  
## productsテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|text|text|null: false|
|category_id|bigint|null: false|
|user_id|integer|null: false|
|url|text|null:false|
|image|text|null:false|
|acter|text|null:false|
### Association

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|taggings_count|integer|null: false|
### Association


  