## アプリケーション名
exercise motivator

## アプリケーション概要
このアプリケーションでは、運動に関するアクティビティを投稿することができ、各ユーザーは他のユーザーの投稿に対してコメントやいいねをすることができます。
また、ユーザーは自身のプロフィールを日々記録することでその推移をグラフにて確認することができます。

## URL

## テスト用アカウント

## 利用方法
まずはユーザー登録をします。ヘッダー右上の

## 目指した課題解決

## 洗い出した要件

## 実装した機能

## 実装予定の機能

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




