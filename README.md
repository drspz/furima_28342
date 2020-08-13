# README


## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

## profiles テーブル

| Column            | Type       | Options     |
| ----------------  | --------   | ----------- |
| first_name	      | string	   | null:false  |
| family_name	      | string	   | null:false  |
| first_name_kana	  | string 	   | null:false  |
| family_name_kana	| string	   | null:false  |
| birth_year	      | date	     | null:false  |
| birth_day	        | date	     | null:false  |
| introduction	    | text	     | null:false  |
| avatar	          | string	   | null:false  |
| user	            | references | null:false  |

## sending_destinations  テーブル

| Column                      | Type       | Options    |
| --------------------------- | ---------- | ---------- |
| user                        | references | null:false |
| destination_first_name	    | string	   | null:false |
| destination_family_name	    | string	   | null:false |
| destination_first_name_kana | string	   | null:false |
| destination_family_name_kana|	string	   | null:false |
| post_code	integer(7)	      |            | null:false |
| prefecture_code	integer     |            | null:false |
| city                        |	string     | null:false | 
| house_number                | string     | null:false | 
| building_name	              | string	   | null:false |
| phone_number	              | integer	   | null:false | 


## credit_cards テーブル

| Column               |  Type        | Options                        |
| -------------------- | ------------ | ------------------------------ |
| card_number	         |  integer	    | null:false                     |
| expiration_year	     |  integer	    | null:false                     |
| expiration_month     |  integer	    | null:false                     |
| security_code	       |  integer	    | null:false                     |
| user	               |  references	| null:false, foreign_key: true  |

## points テーブル

| Column   | Type       | Options    |
| -------- | ---------- | ---------- |
| point    | integer    | null:false |
| user     | references | null:false |

## user_evaluations テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| review	   | text	      | null:false                    |
| item	     | references	| null:false, foreign_key: true |
| evaluation | references	| null:false, foreign_key: true |
| user	     | references	| null:false, foreign_key: true |


## brands テーブル

| Column | Type       | Options       |
| ------ | ---------- | ------------- |
| name   | string     | null:false    |


## items テーブル

| Column             | Type        | Options                       |
| ------------------ | ----------- | ----------------------------- |
| name	             | string      | null:false                    |
| introduction       | text	       | null:false                    |
| price	             | integer	   | null:false                    |
| brand	             | references	 | null:false, foreign_key: true |
| item_condition     | references  | null:false, foreign_key: true |
| postage_payer	     | references	 | null:false, foreign_key: true |
| prefecture_code	   | integer	   | null:false                    |
| size	             | references  | null:false, foreign_key: true |
| preparation_day	   | references	 | null:false, foreign_key: true |
| postage_type	     | references	 | null:false, foreign_key: true |
| item_img	         | references	 | null:false, foreign_key: true |
| category	         | references	 | null:false, foreign_key: true |
| trading_status	   | references  | null:false                    |
| seller	           | references	 | null:false, foreign_key: true |
| buyer	             | references	 | null:false, foreign_key: true |

## items_images テーブル

| Column   | Type       | Options    |
| -------- | ---------- | ---------- |
| url      | string     | null:false |
| item     | references | null:false |

## favorites テーブル

| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| item       | references	| null:false, foreign_key: true |
| user	     | references	| null:false, foreign_key: true |
## comments テーブル

| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| comment    |	text	    | null:false                    |
| user	     | references	| null:false, foreign_key: true |
| item	     | references	| null:false, foreign_key: true |



## categories テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| name           | string	| null: false |
