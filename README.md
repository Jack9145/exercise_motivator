## アプリケーション名
exercise motivator

## アプリケーション概要
このアプリケーションでは、運動に関するアクティビティを投稿することができ、各ユーザーは他のユーザーの投稿に対してコメントやいいねをすることができます。
また、ユーザーは自身のプロフィールを日々記録することで、その推移をグラフにて確認することができます。

## URL

## テスト用アカウント

## 利用方法
まずはユーザー登録をします。ヘッダー右上の新規登録ボタンからユーザー登録が可能です。記事の投稿についても同様に、右上のヘッダーに投稿ボタンがあります。
記事の詳細ページの遷移するとコメントやいいねをすることができます。

## 目指した課題解決
運動はしたいが続けられない人、ジムに通っていたがコロナの影響でジムに通えなくなった、様々な理由で運動を続けるモチベーションが続かない人に対して
モチベーションを向上させる目的で作成しました。

## 洗い出した要件
ユーザー管理機能     
記事投稿機能  
記事編集機能  
記事削除機能  
いいね機能  
コメント投稿機能  
コメント削除機能  
プロフィール編集機能  
プロフィール可視化機能  
プロフィールのプライベート機能  
ユーザーのフォロー機能  
SNS認証  

## 実装した機能
### ユーザー管理機能
### 記事投稿、削除機能
### コメント投稿、削除機能
### いいね機能
### プロフィール登録機能

## 実装予定の機能
・ プロフィールのプライバシー機能設定  
・ SNS認証

## users テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| nickname | string     | null: false                    |
| email    | string     | null: false, uniqueness: true  |
| password | references | null: false, foreign_key: true |

### Association
- has_many :posts
- has_many :comments
- has_many :favorites
- has_many :profiles


## posts テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| title    | string     | null: false                    |
| text     | text       | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_many :favorites


## comments テーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| text     | text       | null: false |
| user_id  | integer    | null: false |
| post_id  | integer    | null: false |

### Association
- belongs_to :posts
- belongs_to :user


## favorites テーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| user_id  | integer    | null: false |
| post_id  | integer    | null: false |

### Association
- belongs_to :posts
- belongs_to :user


## profiles テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| height   | integer    |                   |
| weight   | integer    |                   |
| fat_rate | integer    |                   |
| user     | references | foreign_key: true |

### Association
- belongs_to :user

## ローカルでの動作方法




