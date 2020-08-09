# README
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|email|string|null: false,unique,index:true|
### Association
- has_many :todo_lists
- has_many:user_evaluations
- has_many :seller_items(foreign_key:"seller_id",class_name:items)
- has_one:profile,dependent: :destroy
- has_one:sending_destination,dependent: :destroy
- has_one:credit_card,dependent: :destroy


## user_evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key:true|
|item_id|references|null: false,foreign_key:true|
|evaluation_id|integer|null|
|review|text|null: false|
### Association
- belongs_to:user
- belongs_to:item



## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null: false|
|user_id|references|null: false,foreign_key:true|
### Association
- belongs_to:user

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|famliy_name|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birth_year|date|null: false|
|birth_day|date|null: false|
|introduction|text|
|avatar|string|
|user_id|references|null: false,foreign_key:true|
### Association
- belongs_to:user


## todo_listsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key:true|
|list|text|null: false|
### Association
- belongs_to:user


## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key:true|
|point|integer|
### Association
- belongs_to:user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|brand_id|references|null: false,foreign_key:true|
|item_conditions_id|references|null: false,foreign_key:true|
|category_id|references|null: false,foreign_key:true|
|seller_id|references|null: false,foreign_key:true|
|buyer_id|references|null: false,foreign_key:true|
|deal_closed_date|timestamps|
### Association
- belongs_to:size
- belongs_to:brand
- belongs_to:category
- belongs_to_:seller,class_name:"users"
- belongs_to_:buyer,class_name:"users"

## itemimgsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false,foreign_key:true|
|url|string|null:false|

### Association
belongs_to:item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null:false|
### Association
has_many :items

## sizeテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
### Association
has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
### Association
has_many :items


## sending_destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|destination_first_name |string|null: false|
|destination_family_name |string|null: false|
|destination_first_name_kana |string|null: false|
|post_code |integer(7)|null: false|
|prefecture_code|integer|null: false|
|city |string|null: false|
|house_number|string|null: false|
|building_name|string|
|phone_number |string|null: false|unique:true|
### Association
belongs_to:user
