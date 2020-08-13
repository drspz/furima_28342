# README


## users テーブル

| Column            | Type      | Options     |
| ---------------   | --------- | ----------- |
| name              | string    | null:false  |
| email             | string    | null:false  |
| password          | string    | null:false  |
| birth             | date      | null:false  |


## sending_destinations  テーブル

| Column                      | Type       | Options    |
| --------------------------- | ---------- | ---------- |
| user                        | references | null:false |
| post_code                   | string(7)  | null:false |
| prefecture_code             | integer    | null:false |
| city                        |	string     | null:false | 
| house_number                | string     | null:false | 
| building_name               | string     |            |
| phone_number                | string     | null:false | 


## points テーブル

| Column   | Type       | Options    |
| -------- | ---------- | ---------- |
| point    | integer    | null:false |
| user     | references | null:false |


## brands テーブル

| Column | Type       | Options       |
| ------ | ---------- | ------------- |
| name   | string     | null:false    |


## items テーブル

| Column             | Type        | Options                       |
| ------------------ | ----------- | ----------------------------- |
| item_img           | references  | null:false, foreign_key: true |
| item_name          | references  | null:false, foreign_key: true |
| category           | references  | null:false, foreign_key: true |
| item_condition     | references  | null:false, foreign_key: true |
| postage_type       | references  | null:false, foreign_key: true |
| preparation_day    | references  | null:false, foreign_key: true |
| shipping region    | references  | null:false, foreign_key: true |
| selling price      | references  | null:false, foreign_key: true |



## items_images テーブル

| Column   | Type       | Options    |
| -------- | ---------- | ---------- |
| url      | string     | null:false |
| item     | references | null:false |


## purchase テーブル

| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| comment    | text       | null:false                    |
| user_id    | references | null:false, foreign_key: true |
| item_id    | references | null:false, foreign_key: true |

