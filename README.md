# アプリ名
School Chat

# 概要
親ユーザーが子ユーザーを作成し、それぞれがルームに所属するとこでメッセージ投稿によるコミュニケーションをできる。

# 制作背景（意図）
　学校教育の中でオンラインの授業やオンラインでの宿題が増えてきている。しかし先生や友人とのコミュニケーションの手段は少なく、最近では固定電話を持たない家庭も増えてきてきる。そんな中で、コミュニケーションがとれるツールが必要だと感じた。そこで、小学校低学年の児童でも安心してチャットができるツールを作りたいと思った。クラスルームを作成し全体への連絡ととったり、個人ルームを作成し個別相談をしたり、友人と会話することもできるツールである。また、パソコンに慣れてもらうと同時に、キーボード操作を学んでいく事もできる。私自身、チャットを通してタイピングを覚えた経験があるので、これは良い機会であると思う。<br>
　対象が小学生なので、目を引くようなWebアプリケーションとしてアニメーションの再生機能・Lottieも取り入れてみようと考えた。

# ＤＥＭＯ
以下、実装予定内容を含む。
### 新規登録ページ
![新規登録画面](https://user-images.githubusercontent.com/73770392/102333189-6b3f7380-3fd0-11eb-85e5-cee16d9fc204.png)

■親ユーザーとなる先生の新規登録ページ
学校IDを複数人の親ユーザーで共有することにより、グループとしてコミュニケーションができるようになる。


### ログイン画面
![ログイン画面](https://user-images.githubusercontent.com/73770392/102333241-7e524380-3fd0-11eb-87e6-a5f8181d64f4.png)

■生徒のログインページ
先生が作成した生徒IDとパスワードを入力してログインできる。


### TOP画面
![TOP画面](https://user-images.githubusercontent.com/73770392/102333264-86aa7e80-3fd0-11eb-80d9-a74c9bd89207.png)

■TOPページ
ログインに成功するとこのページに遷移する。
画面左のサイドバーからルームに入ることができる。


### CHAT画面
![CHAT画面](https://user-images.githubusercontent.com/73770392/102333289-8f9b5000-3fd0-11eb-941b-20e39d266dac.png)

■ルームごとのチャット画面表示
画面下部のフォームからコメントや画像を投稿できる。


# 課題 / 今後実装したい機能
- 学校IDを登録した後、教師（親ユーザー）が生徒（子ユーザー）のIDを作成することで、ID外のコミュニケーションを分けるようにする。
- 教師がクラスルームを作成し、生徒のIDを作成できる。
- 教師や生徒は個別にルームを作る事ができる。
- コメントや画像の投稿ができる。
- 投稿に対し「いいね」「チェック」の反応をすることができる。



# ＤＢ設計

## school テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| school_name | string | null: false |

### Association

- has_many :users
- has_many :students
- has_many :rooms


## users テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| email     | string     | null: false                    |
| password  | string     | null: false                    |
| nickname  | string     | null: false                    |
| school_id | references | null: false, foreign_key: true |

### Association

- belongs_to :school
- has_many :students
- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages


## students テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| password   | string     | null: false                    |
| nickname   | string     | null: false                    |
| user_id    | references | null: false, foreign_key: true |
| school_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :school
- belongs_to :user
- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages


## rooms テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| room_name  | string     | null: false                    |
| school_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :school
- has_many :room_users
- has_many :users, through: room_users
- has_many :students, through: room_users
- has_many :messages


## room_users テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | string     |                                |
| student_id | string     |                                |
| room_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user
- belongs_to :student


## messages テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| content    | text       |                                |
| user_id    | string     |                                |
| student_id | string     |                                |
| room_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user
- belongs_to :student
- has_one_attached :image
