# テーブル設計
============================================================
## school テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| school_name | string | null: false |

### Association

- has_many :users
- has_many :students
- has_many :rooms

============================================================
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

============================================================
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

============================================================
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

============================================================
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

============================================================
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