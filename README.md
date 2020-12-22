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
| user_id  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_many :favorites


## comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| text     | text       | null: false                    |
| user_id  | references | null: false, foreign_key: true |
| post_id  | references | null: false, foreign_key: true |

### Association
- belongs_to :posts
- belongs_to :user


## favorites テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| post_id  | references | null: false, foreign_key: true |

### Association
- belongs_to :posts
- belongs_to :user


## profiles テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| height   | integer    |                   |
| weight   | integer    |                   |
| fat_rate | integer    |                   |
| user_id  | references | foreign_key: true |

### Association
- belongs_to :user




