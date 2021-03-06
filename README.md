# アプリケーション名

   「DouzoApp 〜どうぞ〜」

![ezgif com-gif-maker](https://user-images.githubusercontent.com/83441050/123572982-0f1f9c80-d808-11eb-9371-e1dc1511fb83.gif)

# アプリケーションの概要
 - 不要になった学用品（体操服，制服，学習道具など）を出品したり，欲しい学用品を購入または譲り受けることができます。
 - 出品されたアイテムに対してコメントをしたり，購入者と出品者が個別にコメントを交わしたりすることもできます。

# アプリケーション URL
https://douzo-app.herokuapp.com/

# 制作背景
 ### 「誰の」
  主に保育園（幼稚園），小中学校の子どもがいる家庭の保護者

 ### 「どのような課題を解決するためか」
 「子どもの成長や卒業等により，不要になった学用品を，売り（または譲り）たい。」
 「学用品が欲しいが，子どもの成長による買い替えや費用の面の課題があるため，安く購入したい。」
 「知り合いが少なく，「売り（譲り）たい」「欲しい」相手が分からない。」

 以上の願いをマッチさせるためのアプリケーションを作りたいと思い，開発している途中です。

# DEMO

 ### アイテム検索
![ezgif com-gif-maker (1)](https://user-images.githubusercontent.com/83441050/123573766-7db12a00-d809-11eb-9d20-0a84cfb422f8.gif)

# 実装予定の機能
 - 購入予定者と出品者だけでコメントしあえる機能
 - 購入予約をすると，予約済みの表示がされるようにする
 - 出品物のサンプル画像をスライド表示する

# 開発環境
- VScode
- Ruby 2.6.5
- Rails 6.0.0
- mysql2 0.4.4
- JavaScript
- heroku 7.54.1

# DB設計

## Users テーブル 

| Column               | Type    | Options                   |
| -------------------- | ------- | ------------------------- |   
| nickname             | string  | null: false               |
| email                | string  | null: false, unique: true |
| encrypted_password   | string  | null: false               |
| introduction         | string  |                           |

### Association

has_many :items
has_many :orders
has_many :comments



## Items テーブル 

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |   
| name            | string       | null: false                    |
| item_text       | text         | null: false                    |
| category_id     | integer      | null: false                    |
| price           | integer      | null: false                    |
| user            | references   | null: false, foreign_key: true |

### Association

belongs_to :user
has_one :order
has_many :comments



##  Ordersテーブル 

| Column     | Type        | Options                        |
| ---------- | ----------- | ------------------------------ |   
| item       | references  | null: false, foreign_key: true |
| user       | references  | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item



## Comments テーブル 

| Column               | Type        | Options                        |
| -------------------- | ----------- | ------------------------------ |   
| comment              | text        | null: false                    |
| item                 | references  | null: false, foreign_key: true |
| user                 | references  | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item