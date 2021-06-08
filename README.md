# :sunny: 「高校野球 練習試合マッチ」 :sunny:

# :baseball: アプリケーション概要
このアプリは私が高校教員をしていて、特に困ったことを解決するために作成したアプリケーションである。
アプリの目的を説明する前に、現在高校野球を指導している教員が置かれている現状をお伝えしたいと思う。

- 練習試合を組むには、現状電話でのやり取りが慣習的で、メールなどを使用するのは失礼だと考える指導者もいる。そのため1件1件電話をするのは、非常に労力のいる仕事である。
- 高校野球を指導している教員は、部活以外の仕事も多く任されることがあり、非常に多忙である人が多い。
- 苦労して組んだ練習試合でも、コロナウイルスの影響で突然のキャンセルが増え、前日になって次の日の予定が白紙になってしまうことがある。
- 多くの部活動が参加できる練習試合マッチングアプリはすでに存在しているが、他競技も含まれているので、日常で使用している指導者は少ないと感じている。「高校野球」競技を限定的にすることで、より競技性とマッチした内容に仕上げた。

 上記のことを解決するために、本アプリケーションを開発した。アプリケーションの目的は、次の3つに分けられる。

### 「練習試合をもっと楽に組める」＋「いままでの慣習を根本的には崩さない」
これを実現するために「練習試合募集の掲示板」的な意味合いが強いアプリにする。
### 急なキャンセルが出た時に、同じような悩みを抱えているチームを探し出せる。
コロナウイルスの影響により突然のキャンセルを受けた学校同士がマッチングできるようにする。
### 高校野球指導者の業務を減らし、もっと選手との時間を増やせるようにする。
高校野球は「選手が主役」である。この大原則をこれからも守るためには、教員の業務を減らすことが一番大切である。

以上の目的から、本アプリケーションを開発した。
現在、多くの部活動が参加できる練習試合マッチングアプリはすでに存在しているが、他競技も含まれているため、日常で使用している教員は少ないと感じている。
「高校野球」と競技を限定的にすることで、より競技性とマッチした内容に仕上げている。


# :globe_with_meridians: App URL
https://practice-game-35540.herokuapp.com/

# :unlock: テスト用アカウント
### ログインに必要な情報
- 

### Basic認証ID/Pass
- 
- 

# :arrow_forward: 利用方法


# :black_nib: 機能一覧
| 機能               | 概要                                    |
|-------------------|-----------------------------------------|
| ユーザー管理機能     | 新規登録・ログイン・ログアウトが可能          |
| 学校登録機能        | 学校登録が可能                             |
| 登録高校一覧機能     | 登録された学校の閲覧が可能                  |
| 登録高校詳細表示機能  | 登録された学校の詳細の閲覧が可能             |
| 試合募集投稿機能     | 練習試合の申し込みを投稿することができる       |
| 試合募集一覧機能     | 募集している試合の一覧が表示される            |
| 試合募集検索機能     | 募集している試合を都道府県で検索が可能         |
| 試合募集詳細機能     | 試合の日時や場所など、試合詳細の閲覧が可能      |
| メッセージ投稿機能   | 詳細ページから非同期通信でメッセージの送信が可能 |


# :school: 課題解決
| ユーザーストーリーから考える課題 | 課題解決 |
|--------------------|----------|
| 練習試合を募集している高校が連絡しないとわからないという課題 | 試合募集一覧機能で確認・検索ができる   |
| 試合をする相手のチームレベルがわからないという課題 | チーム詳細を閲覧することで、試合前に相手チームの情報を確認することができる |
| 試合を組むときに必ず電話しなければならないという課題 | メッセージ機能で直接やり取りする事ができる |

# :wrench: 今後実装予定の機能
- Dockerを導入したアプリケーション運用
- 日時が過ぎた試合が自動的に表示されないようにする機能

# :computer: DB設計
## users table

| Column             | Type     | Options                   |
|--------------------|----------|---------------------------|
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| teacher_name       | string   | null: false               |
| school_name        | string   | null: false               |

### アソシエーション
belongs_to : team
has_many : games
has_many : messages


## teams table

| Column        | Type       | Options                       |
|---------------|------------|-------------------------------|
| user          | references | null: false, foreign_key:true |
| area_id       | integer    | null: false                   |
| member_id     | integer    | null: false                   |
| team_level_id | integer    | null: false                   |
| profile       | text       |                               |

### アソシエーション
has_one : user

## games table

| Column          | Type       | Options                       |
|-----------------|------------|-------------------------------|
| practice_date   | date       | null: false                   |
| area_id         | integer    | null: false                   |
| recruit_id      | integer    | null: false                   |
| place_id        | integer    | null: false                   |
| comment         | string     | null: false                   |
| battle_level_id | integer    | null: false                   |
| user            | references | null: false, foreign_key:true |

### アソシエーション
belongs_to : user
has_many : messages

## messages table

| Column      | Type       | Options     |
|-------------|------------|-------------|
| messages    | text       | null: false |
| user        | references | null: false |
| game        | references | null: false |

### アソシエーション
belongs_to : game
belongs_to : user

# :earth_asia: 開発環境
- VScode
- Ruby 2.6.5
- rails 6.0.0
- HTML/CSS
- JavaScript
- Mysql2 0.4.4
- bootstrap 4.1.1
- Heroku
- GitHub

# :star: ローカルでの動作方法
$ git clone https://github.com/0925Daiki/practice-game
$ cd practice-game
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails s
 :point_right: http://localhost:3000
