# アプリケーション名
「高校野球 練習試合マッチ！〜road to 甲子園〜」

# アプリケーション概要
## ペルソナ
- 20代〜50代の高校野球指導者
- 校内でも重要な役職を任され、日々忙しく仕事をしながら、情熱的に高校球児を指導している。日々の業務に追われ、練習試合を組む連絡をするのが、終業後や休日に行っている。
- 毎週土日や長期休み中の練習試合の相手に困っている。
- 自分のチームレベルに合った高校と試合を組みたいと思っている。
- 急なキャンセルが出た時の練習試合相手に困っている。

## 開発の目的
- 生徒のために、日々忙しく働いている高校野球指導者が1番苦労しているのが、練習試合の段取りである。
- スケジュール管理については便利なアプリが普及しているが、指導者を結びつけるマッチングアプリが普及していないのが現状である。
 そのため、本アプリは、練習試合マッチングに特化したアプリとした。
- 多くの部活が参加できる練習試合マッチングアプリはすでに存在しているが、他競技も含まれているので、登録者は多いが、日常で使用している指導者は少ないと感じた。
- 競技を限定的にすることで、より競技性とマッチした内容に仕上げた。
- 新型コロナウイルスの影響で急なキャンセルが激増した。急なキャンセル時に練習試合を組むのが大変なので、急募ページを強調した仕様にした。

## 課題解決
- 慣習的に電話での連絡を重要視する指導者の意識を変え、効率的に練習試合のスケジューリングを行えるようになる。

# URL


# テスト用アカウント(ログインに必要な情報・Basic認証ID/Pass)

# データベース設計
## users table

| Column             | Type     | Options                   |
|--------------------|----------|---------------------------|
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| teacher_name       | string   | null: false               |
| school_name        | string   | null: false               |

## アソシエーション
belongs_to : team


## teams table

| Column        | Type       | Options                       |
|---------------|------------|-------------------------------|
| user          | references | null: false, foreign_key:true |
| area_id       | integer    | null: false                   |
| member_id     | integer    | null: false                   |
| team_level_id | integer    | null: false                   |
| profile       | text       |                               |

## アソシエーション
has_one : user
has_many : games
has_many : messages

## games table

| Column          | Type       | Options     |
|-----------------|------------|-------------|
| place_id        | integer    | null: false |
| comment         | string     | null: false |
| team_level_id   | references | null: false |
| battle_level_id | integer    | null: false |

## アソシエーション
belongs_to : team
has_many : messages

## messages table

| Column      | Type       | Options     |
|-------------|------------|-------------|
| messages    | integer    | null: false |
| school_name | references | null: false |

## アソシエーション
belongs_to : team
belongs_to : game
